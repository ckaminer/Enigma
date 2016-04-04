require_relative '../lib/rotator'
require 'pry'

class Cipher

  attr_reader :rotated_pairs, :rotation_array

  def initialize(key = nil, date = nil, direction = (1))
    @key = key
    @date = date
    @direction = direction
    @rotated_pairs
    @rotation_array = []
    @rotators = Rotator.new(@key, @date)
  end

  def input_sanitizer(input)
    input.to_s
  end

  def split_string(string)
    input_sanitizer(string).split("").each_slice(4) do |piece|
      @rotation_array << piece
    end
    @rotation_array
  end

  def rotate_characters(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    rotated_characters = characters.rotate(rotation)
    @rotated_pairs = Hash[characters.zip(rotated_characters)]
  end

  def rotate_A
    rotate_characters(@rotators.rotator_A)
  end

  def map_rotated_characters
    encrypted_array = []
    @rotation_array.each do |chunk|
      rotate_characters(@direction * @rotators.rotator_A)
      encrypted_array << @rotated_pairs[chunk[0]]
      #binding.pry
      rotate_characters(@direction * @rotators.rotator_B)
      encrypted_array << @rotated_pairs[chunk[1]]
      rotate_characters(@direction * @rotators.rotator_C)
      encrypted_array << @rotated_pairs[chunk[2]]
      rotate_characters(@direction * @rotators.rotator_D)
      encrypted_array << @rotated_pairs[chunk[3]]
    end
    puts encrypted_array.flatten.join
  end

end

# c = Cipher.new(82254)
# c.split_string("l3 4s")
# c.map_rotated_characters
