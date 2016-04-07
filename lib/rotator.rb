require './lib/generator'
require 'pry'

class Rotator

  attr_reader :key, :offset, :generator, :rotator_array

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


  def rotator_A
    key.to_s[0..1].to_i + offset[0].to_i
  end

  def rotator_B
    key.to_s[1..2].to_i + offset[1].to_i
  end

  def rotator_C
    key.to_s[2..3].to_i + offset[2].to_i
  end

  def rotator_D
    key.to_s[3..4].to_i + offset[3].to_i
  end

  def rotator_E
    key.to_s[4..5].to_i + offset[4].to_i
  end

  def rotator_F
    key.to_s[5..6].to_i + offset[5].to_i
  end

end
