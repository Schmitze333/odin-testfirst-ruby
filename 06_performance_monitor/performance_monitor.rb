def measure(anz = 1, &block)
  start = Time.now
  anz.to_i.times { block.call }
  ending = Time.now
  (ending - start) / anz 
end


