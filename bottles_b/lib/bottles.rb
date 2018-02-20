class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(verse_number)
    current_bn = number_of_bottles(verse_number)
    next_bn    = number_of_bottles(current_bn.next)

    "#{current_bn.quantity.capitalize} #{current_bn.container} of beer on the wall, " +
    "#{current_bn.quantity} #{current_bn.container} of beer.\n" +
    "#{current_bn.action}, " +
    "#{next_bn.quantity} #{next_bn.container} of beer on the wall.\n"
  end

  def number_of_bottles(number)
    type = Object.const_get("BottleNumber#{number}")
    type.new(number)
  rescue NameError
    BottleNumber.new(number)
  end

end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    'bottles'
  end

  def pronoun
    'one'
  end

  def quantity
    number.to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def next
    number - 1
  end


end

class BottleNumber0 < BottleNumber

  def quantity
    'no more'
  end

  def action
    "Go to the store and buy some more"
  end

  def next
     99
  end

end

class BottleNumber1 < BottleNumber
  def container
      'bottle'
  end

  def pronoun
    'it'
  end
end
    

class BottleNumber6 < BottleNumber
  def quantity
    "1"
  end

  def container
      "six-pack"
  end
end
