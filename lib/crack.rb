require './lib/decrypt'
require 'pry'

class Crack

  attr_reader :rotator

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
    @modulo_hash = {0 => "A", 1 => "B", 2 => "C", 3 => "D"}
    @charcater_hash = {}
    #@cipher = Cipher.new(@key, @date)
    @rotator = Rotator.new(@key, @date)
  end

  def find_message_length(message)
    message.to_s.length - 7
  end

  def calculate_modulo_remainder(message)
    find_message_length(message) % 4
  end

  def starting_rotator(message)
    @modulo_hash[calculate_modulo_remainder(message)]
  end

  def rotate(character, expected_character)
    counter = 0
    stop_point = character_map.index(expected_character)
    #rotated_characters = []
    until character_map.index(character) == rotated_characters.index(character)
      character_map = character_map.rotate(1)
      counter += 1
    end
    counter
  end






  def calculate_first_key(message)
    total_rotator = character_map.index(message.to_s[-7]) - character_map.index(".")
    if starting_rotator(message) == "A"
      @rotator_A = total_rotator
      #first_key = total_rotator - @rotator.offset[0].to_i
    elsif starting_rotator(message) == "B"
      @rotator_B = total_rotator
      #first_key = total_rotator - @rotator.offset[1].to_i
    elsif starting_rotator(message) == "C"
      @rotator_C = total_rotator
      #first_key = total_rotator - @rotator.offset[2].to_i
    elsif starting_rotator(message) == "D"
      @rotator_D = total_rotator
      #first_key = total_rotator - @rotator.offset[3].to_i
    end
    #first_key
  end

  def calculate_second_key(message)
    total_rotator = character_map.index(message.to_s[-6]) - character_map.index(".")
    if starting_rotator(message) == "A"
      @rotator_A = total_rotator
      #second_key = total_rotator - @rotator.offset[1].to_i
    elsif starting_rotator(message) == "B"
      @rotator_B = total_rotator
      #second_key = total_rotator - @rotator.offset[2].to_i
    elsif starting_rotator(message) == "C"
      @rotator_C = total_rotator
      #second_key = total_rotator - @rotator.offset[3].to_i
    elsif starting_rotator(message) == "D"
      @rotator_D = total_rotator
      #second_key = total_rotator - @rotator.offset[0].to_i
    end
    #second_key
  end

  def calculate_third_key(message)
    total_rotator = character_map.index(message.to_s[-5]) - character_map.index("e")
    if starting_rotator(message) == "A"
      @rotator_A = total_rotator
      #third_key = total_rotator - @rotator.offset[2].to_i
    elsif starting_rotator(message) == "B"
      @rotator_B = total_rotator
      #third_key = total_rotator - @rotator.offset[3].to_i
    elsif starting_rotator(message) == "C"
      @rotator_C = total_rotator
      #third_key = total_rotator - @rotator.offset[0].to_i
    elsif starting_rotator(message) == "D"
      @rotator_D = total_rotator
      #third_key = total_rotator - @rotator.offset[1].to_i
    end
    #third_key
  end

  def calculate_fourth_key(message)
    total_rotator = character_map.index(message.to_s[-4]) - character_map.index("n")
    if starting_rotator(message) == "A"
      @rotator_A = total_rotator
      #fourth_key = total_rotator - @rotator.offset[3].to_i
    elsif starting_rotator(message) == "B"
      @rotator_B = total_rotator
      #fourth_key = total_rotator - @rotator.offset[0].to_i
    elsif starting_rotator(message) == "C"
      @rotator_C = total_rotator
      #fourth_key = total_rotator - @rotator.offset[1].to_i
    elsif starting_rotator(message) == "D"
      @rotator_D = total_rotator
      #fourth_key = total_rotator - @rotator.offset[2].to_i
    end
    #fourth_key
  end

  def decrypt(message)
    decryptor = Decrypt.new
    # @rotator.rotator_A = @rotator_A
    # @rotator.rotator_B = @rotator_B
    # @rotator.rotator_C = @rotator_C
    # @rotator.rotator_D = @rotator_D
    decryptor.decrypt(message)
  end

  # def compile_first_three_key_digits(message)
  #   first_key = calculate_first_key(message)
  #   second_key = calculate_second_key(message)
  #   until calculate_first_key(message).to_s.rjust(2, "00")[1] == calculate_second_key(message).to_s.rjust(2, "00")[0]
  #     first_key += 39
  #     second_key +=39
  #   end
  #   puts first_key
  #   puts second_key
  # end



# y5bq3ugprbpqvvcm40cg

  def character_map
    ("a".."z").to_a + ("0".."9").to_a + ("A".."Z").to_a + (" .,!@#$%^&*()[]<>;:/?\|").chars
  end

end
