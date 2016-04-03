require "../classes/generator"
require 'pry'

class Rotator

  def initialize(key, date)
    @generator = Generator.new(key,date)
    @key = @generator.key
    @date = @generator.date
  end

  def rotator_A
    @key[0..1].to_i + @date[0].to_i
  end

  def rotator_B
    @key[1..2].to_i + @date[1].to_i
  end

  def rotator_C
    @key[2..3].to_i + @date[2].to_i
  end

  def rotator_D
    @key[3..4].to_i + @date[3].to_i
  end

end
