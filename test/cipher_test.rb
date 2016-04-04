require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cipher.rb'
require 'pry'

class CipherTest < Minitest::Test

  def test_split_string_returns_array_of_four_character_pieces
    c = Cipher.new
    c.split_string("hello world")

    result = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    assert_equal c.rotation_array, result
  end

  def test_rotate_characters_works
    c = Cipher.new
    c.rotate_characters(2)

    assert_equal "c", c.rotated_pairs["a"]
  end

end
