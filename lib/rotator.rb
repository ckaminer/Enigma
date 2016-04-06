require './lib/generator'
require 'pry'

class Rotator

  attr_reader :key, :offset

  def initialize(key = nil, date = nil)
    @generator = Generator.new(key,date)
    @key = @generator.set_key
    @offset = @generator.set_offset
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
