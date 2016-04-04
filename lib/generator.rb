require 'pry'
class Generator

  def initialize (key = nil, date = nil)
    @key = key
    @date = date
  end

  def key
    @key.to_s || @key = rand(99999).to_s.rjust(5, "00000")
  end

  def date
    @date || @date = Time.now.strftime("%d%m%y")
  end

end
