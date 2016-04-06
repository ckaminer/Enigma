require_relative '../lib/cipher'
require 'pry'

class Encrypt
  # attrs
  def initialize(key = nil, date = nil)
    @key = key
    @date = date
    @direction = 1
  end

  # def input_sanitizer(message)
  #   message.to_s
  # end

  def encrypt(message)
    cipher = Cipher.new(@key, @date, @direction)
    formatted_input = input_sanitizer(message)
    cipher.split_string(formatted_input)
    cipher.map_rotated_characters
  end

end


if __FILE__ == $0
  message = File.read(ARGV[0])
  key = ARGV[2]
  date = ARGV[3]
  encrypted_message = Encrypt.new(key, date).encrypt(message.chomp)

  File.write(ARGV[1], encrypted_message)
  puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
end
