class Book

  def title
    little_words = %w(and in the of a an)
    @title.capitalize.split.each { |w| w.capitalize! unless little_words.include?(w) }.join(' ')
  end

  def title=(value)
    @title = value
  end

end
