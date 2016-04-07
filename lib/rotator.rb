require './lib/generator'

class Rotator

  attr_reader :key, :offset, :generator
  attr_accessor :rotator_array

  def initialize(key = nil, date = nil)
    @generator = Generator.new(key,date)
    @key = @generator.set_key
    @offset = @generator.set_offset
    @rotator_array = []
  end

  def split_offset
    @offset.split("")
  end

  def create_rotator_array
    split_offset.each_with_index do |value, index|
      @rotator_array << @key.to_s[index..index+1].to_i + value.to_i
    end
    @rotator_array
  end

end
