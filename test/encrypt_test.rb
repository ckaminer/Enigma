require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt.rb'
require 'pry'

class EncryptTest < Minitest::Test

  def test_pulls_in_cipher
    e = Encrypt.new
    assert_equal Cipher, e.cipher.class
  end

  def test_manual_key_used_in_cipher
    e = Encrypt.new(1234567)

    assert_equal 1234567, e.cipher.key
  end

  def test_manual_date_used_in_cipher
    e = Encrypt.new(1234567, "030416")

    assert_equal "030416", e.cipher.date
  end

  def test_cipher_direction_is_positive
    e = Encrypt.new

    assert_equal 1, e.cipher.direction
  end

  def test_encrypted_message_is_correct_length
    e = Encrypt.new
    message = "lets go"
    result = e.encrypt(message)

    assert_equal message.length, result.length
  end

  def test_encrypt_returns_encrypted_message
    e = Encrypt.new("1234567", "030416")
    result = e.encrypt("lets go ok yeah")

    assert_equal "y4U.D;1e1Tenr0I", result
  end

end
