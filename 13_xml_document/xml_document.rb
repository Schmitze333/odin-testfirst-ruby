class XmlDocument

  def initialize(indent = false)
    @indent = indent
    @nest_level = 0
  end

  def method_missing(name, options = nil, &block)
    if block
      "#{open_tag(name, options)}#{block.call}#{close_tag(name)}"
    else
      solo_tag(name, options)
    end
  end

  private
    
    def solo_tag(name, options)
      xml = ""
      @nest_level.times { xml += "  " } if @indent
      xml += "<#{name}"
      if options
        options.keys.each do |k|
          xml +=" #{options.keys.first}='#{options[options.keys.first]}'"
        end
      end
      xml += "/>"
      xml += "\n" if @indent
      return xml
    end

    def open_tag(name, options)
      xml = ""
      @nest_level.times { xml += "  " } if @indent
      xml += "<#{name}"
      if options
        options.keys.each do |k|
          xml +=" #{options.keys.first}='#{options[options.keys.first]}'"
        end
      end
      xml += ">"
      xml += "\n" if @indent
      @nest_level += 1
      return xml
    end

    def close_tag(name)
      xml = ""
      @nest_level -= 1
      @nest_level.times { xml += "  " } if @indent
      xml += "</#{name}>"
      xml += "\n" if @indent
      return xml
    end
end
