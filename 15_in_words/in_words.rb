Fixnum.class_eval do

  def in_words
    decode(self)
  end

  private

    def decode(nb)
      return zero if nb == 0
      if nb < 20
        return single(nb)
      else
        trillions, billions = nb.divmod(1000000000000)
        billions, millions = billions.divmod(1000000000)
        millions, thousands = millions.divmod(1000000)
        thousands, hundreds = thousands.divmod(1000)
        hundreds, tenth = hundreds.divmod(100)
        tenth, singles = tenth.divmod(10)
        word = ""
        word += trillions(trillions) if trillions > 0
        word += " " if nb > 1000000000000 and billions > 0
        word += billions(billions) if billions > 0
        word += " " if nb > 1000000000 and millions > 0
        word += millions(millions) if millions > 0
        word += " " if nb > 1000000 and thousands > 0
        word += thousands(thousands) if thousands > 0
        word += " " if nb > 1000 and hundreds > 0
        word += hundreds(hundreds) if hundreds > 0
        if tenth > 1
          word += " " if nb > 100 and tenth > 0
          word += tenth(tenth) if tenth > 0
          word += " " if nb > 10 and singles > 0
          word += single(singles)
        elsif singles > 0
          word += " " if nb > 10
          word += single(tenth*10+singles)
        end
      end
      word
    end

    def zero
      'zero'
    end
    
    def single(nb)
      case nb
      when 0 then ''
      when 1 then 'one'
      when 2 then 'two'
      when 3 then 'three'
      when 4 then 'four'
      when 5 then 'five'
      when 6 then 'six'
      when 7 then 'seven'
      when 8 then 'eight'
      when 9 then 'nine'
      when 10 then 'ten'
      when 11 then 'eleven'
      when 12 then 'twelve'
      when 13 then 'thirteen'
      when 14 then 'fourteen'
      when 15 then 'fifteen'
      when 16 then 'sixteen'
      when 17 then 'seventeen'
      when 18 then 'eighteen'
      when 19 then 'nineteen'
      end
    end
    
    def tenth(nb)
      case nb
      when 1 then 'ten'
      when 2 then 'twenty'
      when 3 then 'thirty'
      when 4 then 'forty'
      when 5 then 'fifty'
      when 6 then 'sixty'
      when 7 then 'seventy'
      when 8 then 'eighty'
      when 9 then 'ninety'
      end
    end

    def hundreds(nb)
      "#{single(nb)} hundred"
    end
    

    def thousands(nb)
      word = decode(nb)
      word += " thousand"
      word
    end


    def millions(nb)
      word = decode(nb)
      word += " million"
      word
    end

    def billions(nb)
      word = decode(nb)
      word += " billion"
      word
    end

    def trillions(nb)
      word = decode(nb)
      word += " trillion"
      word
    end
end
