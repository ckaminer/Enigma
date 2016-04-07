require_relative '../lib/cipher'
require 'pry'

class Encrypt

  attr_reader :key, :date, :cipher

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
    @direction = 1
    @cipher = Cipher.new(@key, @date, @direction)
  end

  def encrypt(message)
    formatted_input = message.to_s
    @cipher.split_string(formatted_input)
    @cipher.map_rotated_characters
  end

end

if __FILE__ == $0
  message = File.read(ARGV[0])
  encryptor = Encrypt.new
  key = encryptor.cipher.rotators.generator.key
  date = encryptor.cipher.rotators.generator.date
  encrypted_message = encryptor.encrypt(message.chomp)
  #binding.pry
  File.write(ARGV[1], encrypted_message)
  puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
end
