require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/generator.rb'
require 'pry'

class GeneratorTest < Minitest::Test

  def test_key_returns_something_if_nothing_entered
    g = Generator.new
    key = g.set_key
    assert key
  end

  def test_key_returns_key_if_entered_manually
    g = Generator.new("43567")
    key = g.set_key

    assert_equal "43567", key
  end

  def test_key_gets_converted_to_string
    g = Generator.new(43567)
    key = g.set_key

    assert_equal "43567", key
  end

  def test_date_returns_todays_date_if_nothing_entered
    g = Generator.new
    assert_equal "040416", g.set_date
  end

  def test_date_returns_input_if_date_entered_manually
    g = Generator.new(12345, "030416")
    assert_equal "030416", g.set_date
  end

  # def test_date
  #   g = Generator.new(43257, "030416")
  #   assert_equal "030416", g.date
  # end

  def test_offset_calculated_correctly
    g = Generator.new(12345, "030416")
    assert_equal "3056", g.set_offset
  end

end
