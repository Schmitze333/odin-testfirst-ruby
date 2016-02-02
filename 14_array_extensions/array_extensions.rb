Array.class_eval do
  def sum
    if self.empty?
      0
    else
      sum = 0
      self.each do |elem|
        sum += elem
      end
      sum
    end
  end

  def square
    if self.empty?
      self
    else
      self.map { |e| e * e }
    end
  end

  def square!
    if self.empty?
      self
    else
      self.map! { |e| e * e }
    end
  end
end
