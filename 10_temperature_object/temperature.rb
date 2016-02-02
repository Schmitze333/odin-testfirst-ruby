class Temperature

  def Temperature.from_celsius(t)
    Temperature.new(:c => t)
  end

  def Temperature.from_fahrenheit(t)
    Temperature.new(:f => t)
  end

  def initialize(t_hash)
    @fahr ||= t_hash[:f]
    @cels ||= t_hash[:c]
    @fahr ||= to_fahr(@cels)
    @cels ||= to_cels(@fahr)
    @fahr ||= 32
    @cels ||= 0
  end

  def in_fahrenheit
    @fahr
  end

  def in_celsius
    @cels
  end

  private

  def to_cels(t)
    (t.to_f - 32.0) * 5.0/9.0
  end

  def to_fahr(t)
    t.to_f * 9.0/5.0 + 32
  end

end

class Celsius < Temperature

  def initialize(t)
    super(:c => t)
  end
end

class Fahrenheit < Temperature

  def initialize(t)
    super(:f => t)
  end
end
