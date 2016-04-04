require 'minitest/autorun'
require 'minitest/pride'
require_relative '../classes/generator.rb'
require 'pry'

class GeneratorTest < Minitest::Test

  def test_key_returns_something
    g = Generator.new
    key = g.key
    assert key
  end

  def test_date_returns_todays_date
    g = Generator.new
    assert_equal "020416", g.date
  end

  def test_rotators_are_calculated_correctly
    g = Generator.new("12345", "6789")
    assert_equal 18, g.rotator_A
  end




end
