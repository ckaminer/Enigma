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
    assert_equal "050416", r.date
  end

  def test_rotators_are_calculated_correctly
    r = Rotator.new("12345", "030416")
    assert_equal "3056", r.offset

    assert_equal 15, r.rotator_A
    assert_equal 23, r.rotator_B
    assert_equal 39, r.rotator_C
    assert_equal 51, r.rotator_D
  end

  def test_rotators_convert_key_to_string
    r = Rotator.new(12345, "030416")
    assert_equal 12345, r.key

    assert_equal 15, r.rotator_A
    assert_equal 23, r.rotator_B
    assert_equal 39, r.rotator_C
    assert_equal 51, r.rotator_D
  end


end
