require './lib/cipher'

class Decrypt

  attr_reader :key, :date, :cipher

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
    @direction = -1
    @cipher = Cipher.new(@key, @date, @direction)
  end

  def decrypt(message)
    formatted_input = message.to_s
    @cipher.split_string(formatted_input)
    @cipher.map_rotated_characters
  end

end

if __FILE__ == $0
  encrypted_message = File.read(ARGV[0])
  key = ARGV[2]
  date = ARGV[3]
  decrypted_message = Decrypt.new(key, date).decrypt(encrypted_message.chomp)

  File.write(ARGV[1], decrypted_message)
  puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
end
