class RPNCalculator

  def initialize
    @stack = []
    @value = 0
  end

  def push(elem)
    @stack << elem if elem.is_a? Integer
  end

  def value
    @stack.last
  end

  def plus
    raise 'calculator is empty' if @stack.length < 2
    s2 = @stack.pop
    s1 = @stack.pop
    @stack << (s1 + s2)
  end

  def minus
    raise 'calculator is empty' if @stack.length < 2
    s2 = @stack.pop
    s1 = @stack.pop
    @stack << (s1 - s2)
  end

  def divide
    raise 'calculator is empty' if @stack.length < 2
    divisor = @stack.pop
    dividend = @stack.pop
    @stack << (dividend.to_f / divisor.to_f)
  end

  def times
    raise 'calculator is empty' if @stack.length < 2
    m2 = @stack.pop
    m1 = @stack.pop
    @stack << (m1 * m2)
  end

  def tokens(string)
    a = []
    string.split.each do |elem|
      a << elem.to_i if elem =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
      a << elem.to_sym unless elem =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
    end
    return a
  end

  def evaluate(string)
    i = tokens(string)
    i.each do |elem|
      if elem.is_a? Numeric
        push(elem) 
      else
        case elem
        when :+
          plus
        when :-
          minus
        when :*
          times
        when :/
          divide
        end
      end
    end
    value
  end
end
