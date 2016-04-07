require './lib/rotator'
require 'pry'

class Cipher

  attr_reader :rotated_pairs,
              :rotation_array,
              :rotators,
              :encrypted_array,
              :key,
              :date,
              :direction

  def initialize(key = nil, date = nil, direction = (1))
    @key = key
    @date = date
    @direction = direction
    @rotated_pairs
    @rotation_array = []
    @encrypted_array = []
    @rotators = Rotator.new(@key, @date)
  end

  def split_string(string)
    string.to_s.split("").each_slice(6) do |piece|
      @rotation_array << piece
    end
    @rotation_array
  end

  def rotate_characters(rotation)
    rotated_characters = character_map.rotate(rotation)
    @rotated_pairs = Hash[character_map.zip(rotated_characters)]
  end

  def map_rotated_characters
    @rotators.create_rotator_array
    @rotation_array.each do |chunk|
      chunk.each do |letter|
        index = chunk.index(letter)
        rotate_characters(@direction * @rotators.rotator_array[index].to_i)
        @encrypted_array << @rotated_pairs[letter]
      end
    end
    @encrypted_array.flatten.join
  end

  #     rotate_characters(@direction * @rotators.rotator_A)
  #     @encrypted_array << @rotated_pairs[chunk[0]]
  #     rotate_characters(@direction * @rotators.rotator_B)
  #     @encrypted_array << @rotated_pairs[chunk[1]]
  #     rotate_characters(@direction * @rotators.rotator_C)
  #     @encrypted_array << @rotated_pairs[chunk[2]]
  #     rotate_characters(@direction * @rotators.rotator_D)
  #     @encrypted_array << @rotated_pairs[chunk[3]]
  #     rotate_characters(@direction * @rotators.rotator_E)
  #     @encrypted_array << @rotated_pairs[chunk[4]]
  #     rotate_characters(@direction * @rotators.rotator_F)
  #     @encrypted_array << @rotated_pairs[chunk[5]]
  #   end
  #   @encrypted_array.flatten.join
  # end

  private

    def character_map
      ("a".."z").to_a + ("0".."9").to_a + ("A".."Z").to_a + (" .,!@#$%^&*()[]<>;:/?\|").chars
    end

end
