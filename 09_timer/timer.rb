class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    m, s = @seconds.divmod(60)
    h, m = m.divmod(60)
    "#{format_to_two(h)}:#{format_to_two(m)}:#{format_to_two(s)}"
  end

  private

    def format_to_two(number)
      if number < 10
        '0' + number.to_s
      else
        number.to_s
      end
    end

end
