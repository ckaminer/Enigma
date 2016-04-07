require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt.rb'

class DecryptTest < Minitest::Test

  def test_pulls_in_cipher
    d = Decrypt.new
    assert_equal Cipher, d.cipher.class
  end

  def test_manual_key_used_in_cipher
    d = Decrypt.new(12345)

    assert_equal 12345, d.cipher.key
  end

  def test_manual_date_used_in_cipher
    d = Decrypt.new(12345, "030416")

    assert_equal "030416", d.cipher.date
  end

  def test_cipher_direction_is_negative
    d = Decrypt.new

    assert_equal -1, d.cipher.direction
  end

  def test_decrypted_message_is_correct_length
    d = Decrypt.new
    message = "lets go"
    result = d.decrypt(message)

    assert_equal message.length, result.length
  end

  def test_decrypt_returns_decrypted_message
    d = Decrypt.new("12345", "030416")
    result = d.decrypt("y4U.D;1e1Tenr0I")

    assert_equal "lets go ok yeah", result
  end

end
