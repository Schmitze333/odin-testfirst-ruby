def change_word(word)
  vowels = %w(a e i o u)
  two_letter_beginnings = %w(ch qu th br)
  three_letter_beginnings = %w(thr sch squ)
  if vowels.include? word[0]
    word + "ay"
  elsif index = three_letter_beginnings.index(word[0...3]) 
    word[3..-1] + three_letter_beginnings[index] + "ay"
  elsif index = two_letter_beginnings.index(word[0...2]) 
    word[2..-1] + two_letter_beginnings[index] + "ay"
  else # word starts with 1 consonant
    word[1..-1] + word[0] + "ay"
  end
end

def translate(string)
  words = string.split
  pig_words = words.map { |w| change_word(w) }
  pig_words.join(' ')
end
