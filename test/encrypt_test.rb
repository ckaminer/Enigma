require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def test_pulls_in_cipher
    e = Encrypt.new
    assert_equal Cipher, e.cipher.class
  end

  def test_manual_key_used_in_cipher
    e = Encrypt.new(12345)

    assert_equal 12345, e.cipher.key
  end

  def test_manual_date_used_in_cipher
    e = Encrypt.new(12345, "030416")

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

  def test_encrypt_correctly_encrypts
    e = Encrypt.new("00000", "070416")
    result = e.encrypt("abc")
    assert_equal "dbh", result

    e2 = Encrypt.new("11111", "070416")
    result2 = e2.encrypt("abc")
    assert_equal "oms", result2

    e3 = Encrypt.new("12345", "070416")
    result3 = e3.encrypt("ab")
    assert_equal "py", result3

    e4 = Encrypt.new("22222")
    result4 = e4.encrypt("abc")
    assert_equal "zx3", result4

    e5 = Encrypt.new("01010")
    result5 = e5.encrypt("abc")
    assert_equal "eli", result5

    e6 = Encrypt.new("12300")
    results6 = e6.encrypt("abc")
    assert_equal "pyB", results6

    e7 = Encrypt.new("12345", "030416")
    result = e7.encrypt("lets go ok yeah")
    assert_equal "01W%<3R<37r[txK", result
  end

end
