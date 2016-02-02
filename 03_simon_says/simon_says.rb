def echo(word)
  word
end

def shout(word)
  word.upcase
end
 
def repeat(word, n = 2)
  e_word = word
  (n-1).times { e_word += " #{word}" }
  e_word
end

def start_of_word(word, n = 1)
  word[0...n]
end

def first_word(sentence)
  sentence.split.first
end

def titleize(string)
  little_words = %w(and a over the)
  array = string.capitalize.split.each { |w| w.capitalize! unless little_words.index(w) }
  array.join(' ')
end
