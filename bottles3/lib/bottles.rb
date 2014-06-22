class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(bottle_number)
    "#{quantity(bottle_number).capitalize} #{container(bottle_number)} of beer on the wall, " +
    "#{quantity(bottle_number)} #{container(bottle_number)} of beer.\n" +
    "#{action(bottle_number)}, " +
    "#{quantity(bottle_number-1)} #{container(bottle_number-1)} of beer on the wall.\n"
  end

  private
  def container(bottle_number)
    if bottle_number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(bottle_number)
    if bottle_number == 1
      'it'
    else
      'one'
    end
  end

  def quantity(bottle_number)
    if bottle_number == -1
      99.to_s
    elsif bottle_number == 0
      'no more'
    else
      bottle_number.to_s
    end
  end

  def action(bottle_number)
    if bottle_number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(bottle_number)} down and pass it around"
    end
  end

end