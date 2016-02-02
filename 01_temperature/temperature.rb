def ftoc(fahr)
  (fahr.to_f - 32.0) * 5.0/9.0
end

def ctof(celsius)
  celsius.to_f * 9.0/5.0 + 32
end
