require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher.rb'
require 'pry'

class CipherTest < Minitest::Test

  def test_rotators_are_pulled_in_properly
    c = Cipher.new("12345", "060416")

    assert_equal Rotator, c.rotators.class
    assert_equal 15, c.rotators.rotator_A
    assert_equal 23, c.rotators.rotator_B
    assert_equal 39, c.rotators.rotator_C
    assert_equal 51, c.rotators.rotator_D
  end

  def test_split_string_returns_array_of_four_character_pieces
    c = Cipher.new
    c.split_string("hello world")

    result = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    assert_equal c.rotation_array, result
  end

  def test_rotate_characters_creates_hash
    c = Cipher.new
    c.rotate_characters(4)

    assert_equal Hash, c.rotated_pairs.class
  end

  def test_rotate_characters_properly_rotates
    c = Cipher.new
    c.rotate_characters(2)

    assert_equal "c", c.rotated_pairs["a"]
  end

  def test_encryption_array_is_same_size_as_rotation_array
    c = Cipher.new
    c.split_string("hello world")
    c.map_rotated_characters
    rotation = c.rotation_array.flatten.join.length
    encrypted = c.encrypted_array.flatten.join.length

    assert_equal rotation, encrypted
  end

  def test_map_rotated_characters_works_in_both_directions
    c = Cipher.new("12345", "040416", 1)
    c.split_string("hello world")

    assert_equal "w1lx3uw068d", c.map_rotated_characters

    d = Cipher.new("12345", "040416", -1)
    d.split_string("w1lx3uw068d")

    assert_equal "hello world", d.map_rotated_characters
  end

end
