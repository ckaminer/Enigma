require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotator.rb'

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
    assert_equal 4, r.split_offset.length
  end

  def test_rotators_are_calculated_correctly
    r = Rotator.new("12345", "030416")
    assert_equal "3056", r.offset
    r.create_rotator_array

    assert_equal 15, r.rotator_array[0]
    assert_equal 23, r.rotator_array[1]
    assert_equal 39, r.rotator_array[2]
    assert_equal 51, r.rotator_array[3]
  end

end
