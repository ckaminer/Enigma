require './lib/decrypt'

class Crack

  attr_reader :rotator, :end_of_message

  def initialize(message = "abcd")
    @rotations = []
    @decryptor = Decrypt.new
    @end_of_message = "..end.."
    @message = message
    @rotated_pairs
    @rotation_array = []
    @encrypted_array = []
  end

  def find_message_length
    @message.to_s.length
  end

  def calculate_modulo_remainder
    find_message_length % 4
  end

  def set_final_four_characters
    calculate_modulo_remainder.times do
      @end_of_message = @end_of_message.chop
    end
    @end_of_message[-4..-1]
  end

  def chop_characters_from_encrypted_message
    calculate_modulo_remainder.times do
      @message = @message.chop
    end
    @message[-4..-1]
  end

  def character_index(character)
    character_map.index(character)
  end

  def final_encrypted_chunk
    @message[-7..-1].split("")
  end

  def encrypted_character(index)
    final_encrypted_chunk[index]
  end

  def expected_character(index)
    @end_of_message[index]
  end

  def find_distance(encrypted_character, expected_character)
    space_apart = character_index(encrypted_character) - character_index(expected_character)
    if space_apart >= 0
      distance = space_apart
    else
      distance = ((character_map.length - 1) - character_index(expected_character)) + character_index(encrypted_character)
    end
    distance
  end

  def calculate_character_rotations
    counter = 0
    until counter == 4
      @rotations << find_distance(encrypted_character(counter), expected_character(counter))
      counter += 1
    end
    @rotations
  end

  def rotate_characters(rotation)
    rotated_characters = character_map.rotate(rotation)
    @rotated_pairs = Hash[character_map.zip(rotated_characters)]
  end

  def split_string
    @message.to_s.split("").each_slice(4) do |piece|
      @rotation_array << piece
    end
    @rotation_array
  end

  def map_rotated_characters
    #require 'pry'; binding.pry
    #chop_characters_from_encrypted_message.chars.each do |chunk|
      chop_characters_from_encrypted_message.chars.each do |letter|
        index = chop_characters_from_encrypted_message.chars.index(letter)
        rotate_characters(-1 * @rotations[index].to_i)
        @encrypted_array << @rotated_pairs[letter]
      end
    @encrypted_array.flatten.join
  end

  def crack
    message = @message
    calculate_character_rotations
    @decryptor.cipher.rotators.rotator_array = @rotations
    @decryptor.decrypt(message)
  end

  def character_map
   ("a".."z").to_a + ("0".."9").to_a + ("A".."Z").to_a + (" .,!@#$%^&*()[]<>;:/?|").chars
  end

  # def crack_key(message)
  #   i = 0
  #   #require 'pry',binding.pry
  #   with_leading_zeros = i.to_s.rjust(5, "00000")
  #     until @decryptor.decrypt(message[-7..1]) == @end_of_message
  #       @decryptor.key = with_leading_zeros
  #       with_leading_zeros == @decryptor.key
  #       i += 1
  #     end
  #   with_leading_zeros
  # end

#01W%<3R4>1QS>>

end
