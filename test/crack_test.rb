require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack.rb'

class CrackTest < Minitest::Test

  # def test_character_index_returns_correct_index
  #   c = Crack.new
  #   index = c.character_index("c")
  #
  #   assert_equal 2, index
  # end
  #
  # def test_final_encrypted_chunk_returns_last_seven_characters
  #   c = Crack.new("charlie kaminer..end..")
  #   result = c.final_encrypted_chunk
  #
  #   assert_equal ['.', '.', 'e', 'n', 'd', '.', '.'], result
  # end
  #
  # def test_calculate_module_remainder
  #   c = Crack.new("abc..end..")
  #   result = c.calculate_modulo_remainder
  #   assert_equal 2, result
  # end
  #
  # def test_final_four_characters
  #   c = Crack.new("abc..end..")
  #   result = c.set_final_four_characters
  #
  #   assert_equal ".end", result
  # end
  #
  # def test_encrypted_character_returns_correct_character
  #   c = Crack.new("charlie kaminer..end..")
  #   result = c.encrypted_character(1)
  #
  #   assert_equal ".", result
  # end
  #
  # def test_expected_character_returns_correct_character
  #   c = Crack.new
  #   result = c.expected_character(1)
  #
  #   assert_equal ".", result
  # end
  #
  # def test_find_distance_returns_zero_if_same_character
  #   c = Crack.new
  #   result = c.find_distance(".",".")
  #
  #   assert_equal 0, result
  # end
  #
  # def test_find_distance_works_if_expected_larger_than_encrypted
  #   c = Crack.new
  #   result = c.find_distance("c", ".")
  #
  #   assert_equal 22, result
  # end
  #
  # def test_find_distance_works_if_encrypted_larger_than_expected
  #   c = Crack.new
  #   result = c.find_distance(".","c")
  #
  #   assert_equal 61, result
  # end
  #
  # def test_calculate_character_rotatations_on_proper_end
  #   c = Crack.new("charlie kaminer..end..")
  #   result = c.calculate_character_rotations
  #
  #   assert_equal [0, 0, 0, 0], result
  # end
  #
  # def test_calculate_character_rotations_fills_rotations
  #   c = Crack.new("charlie kaminer")
  #   result = c.calculate_character_rotations
  #
  #   assert_equal [30, 20, 8, 78], result
  # end
  #
  # def test_crack_returns_decrypted_string
  #   c = Crack.new("pyF4>1QS>>")
  #
  #   result = c.crack
  #   assert_equal "abc..end..", result
  # end

  def test_crack
    c = Crack.new("01W%<3R4>1QS>>")
    c.calculate_character_rotations
    c.split_string
    result = c.map_rotated_characters

    assert_equal "lets go..end..", result
  end


end
