require_relative '../lib/cipher'
require 'pry'

class Encrypt
  # attrs
  def initialize(key = nil, date = nil, direction = (1))
    @key = key
    @date = date
    @direction = direction
  end

  def input_sanitizer(message)
    message.to_s
  end

  def encrypt(message)
    cipher = Cipher.new(@key, @date, @direction)
    formatted_input = input_sanitizer(message)
    cipher.split_string(formatted_input)
    cipher.map_rotated_characters
  end

end

# if __FILE__ == $0
#   puts "CHARLIE"
# end
#ruby ./lib/encrypt.rb message.txt encrypted.txt
# ARGV[0] = message.txt
# ARGV[1] = encrypted.txt
