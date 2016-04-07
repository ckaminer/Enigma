require 'minitest/autorun'
require 'minitest/pride'
require './lib/generator.rb'
require 'pry'

class GeneratorTest < Minitest::Test

  def test_key_returns_something_if_nothing_entered
    g = Generator.new
    key = g.set_key
    assert key
  end

  def test_random_key_is_seven_digits_in_length
    g = Generator.new

    assert_equal 7, g.set_key.length
  end

  def test_key_returns_key_if_entered_manually
    g = Generator.new("4356787")
    key = g.set_key

    assert_equal "4356787", key
  end

  def test_date_returns_todays_date_if_nothing_entered
    g = Generator.new
    assert_equal "060416", g.set_date
  end

  def test_date_returns_input_if_date_entered_manually
    g = Generator.new(1234567, "030416")
    assert_equal "030416", g.set_date
  end

  def test_offset_calculated_correctly
    g = Generator.new(1234567, "030416")
    assert_equal "133056", g.set_offset
  end

end
