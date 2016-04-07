require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotator.rb'
require 'pry'

class RotatorTest < Minitest::Test

  def test_key_pulled_in_from_generator
    r = Rotator.new
    assert r.key
  end

  def date_defaults_to_today
    r = Rotator.new
    assert_equal "060416", r.date
  end

  def test_split_offset_returns_array
    r = Rotator.new
    assert_equal Array, r.split_offset.class
  end

  def test_split_offset_length
    r = Rotator.new
    assert_equal 6, r.split_offset.length
  end

  def test_rotators_are_calculated_correctly
    r = Rotator.new("1234567", "030416")
    assert_equal "133056", r.offset
    r.create_rotator_array

    assert_equal 13, r.rotator_array[0]
    assert_equal 26, r.rotator_array[1]
    assert_equal 37, r.rotator_array[2]
    assert_equal 45, r.rotator_array[3]
    assert_equal 61, r.rotator_array[4]
    assert_equal 73, r.rotator_array[5]
  end
  #
  # def test_rotators_convert_key_to_string
  #   r = Rotator.new(12345, "030416")
  #   assert_equal 12345, r.key
  #
  #   assert_equal 15, r.rotator_A
  #   assert_equal 23, r.rotator_B
  #   assert_equal 39, r.rotator_C
  #   assert_equal 51, r.rotator_D
  # end


end
