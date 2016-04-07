class Generator

  attr_reader :key
  attr_accessor :date

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def set_key
    @key ||= rand(99999).to_s.rjust(5, "00000")
  end

  def set_date
    @date ||= Time.now.strftime("%d%m%y")
  end

  def set_offset
    date_squared = (set_date.to_i ** 2).to_s
    offset = date_squared[-4..-1]
  end

end
