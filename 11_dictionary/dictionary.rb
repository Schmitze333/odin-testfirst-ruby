class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(elem)
    @entries.merge!(elem) if elem.is_a? Hash
    @entries[elem] = nil if elem.is_a? String
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    self.keywords.include?(key)
  end

  def find(key)
    @entries.select { |k,v| k.include?(key) }
  end

  def printable
    keys = self.keywords
    print_layout = ""
    keys[0...-1].each do |k|
      print_layout += "[#{k}] \"#{@entries[k]}\"\n"
    end
    print_layout += "[#{keys.last}] \"#{@entries[keys.last]}\""
    print_layout
  end

end
