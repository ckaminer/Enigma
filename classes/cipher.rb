require_relative '../classes/rotator'
require 'pry'

class Cipher

  attr_reader :rotated_pairs

  def initialize(key = nil, date = nil, direction = "+")
    @key = key
    @date = date
    @rotators = Generator.new(@key, @date)
    @direction = direction
    @rotated_pairs
  end

  def split_string_into_four_character_fragments(string)
    string.scan(/.{1,4}/).each do |piece|
      rotation_array << piece
    end
    rotation_array
  end

  def rotate_characters(rotation)
    characters = ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    rotated_characters = characters.rotate(rotation)
    @rotated_pairs = Hash[characters.zip(rotated_characters)]
  end



end
