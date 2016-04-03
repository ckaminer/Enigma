require 'minitest/autorun'
require 'minitest/pride'
require_relative '../classes/cipher.rb'
require 'pry'

class CipherTest < Minitest::Test

  def test_rotate_characters_works
    c = Cipher.new
    c.rotate_characters(2)

    assert_equal "c", c.rotated_pairs["a"]
  end

end
