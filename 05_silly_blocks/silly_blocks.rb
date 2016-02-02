def reverser(&block)
  s = block.call
  s.split.each { |w| w.reverse! }.join(' ')
end

def adder(n=1, &block)
  number = block.call
  number += n
end

def repeater(times = 1, &block)
  times.times { block.call }
end
