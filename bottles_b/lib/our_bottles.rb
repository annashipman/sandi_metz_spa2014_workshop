class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    case number
    when 0
      "No more #{container(number)} of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.\nTake #{article(number)} down and pass it around, #{next_number(number)} #{container(number - 1)} of beer on the wall.\n"
    end
  end

  private
  def container(number_bottles)
    if (number_bottles == 1) 
      'bottle'
    else
      'bottles'
    end
  end

  def next_number(number_bottles)
    if (number_bottles == 1)
      'no more'
    else 
      "#{number_bottles - 1}"
    end
  end

  def article(number_bottles)
    if (number_bottles == 1)
      "it"
    else
      "one"
    end
  end  

end
