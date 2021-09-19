
# This represents card objects for the game of set
# should have the 4 properties of the cards, as well
# setter and getter methods for each
#
#

class Card
  @shape
  @color
  @number_of_shapes
  @fill
  @cardcode
  #constructor
  def initialize(shape, color, number, fill)

    set_shape(shape)
    set_fill(fill)
    set_number_of_shapes(number)
    set_color(color)
    set_cardCode
  end

  #setter methods
  def set_shape(shape)
    @shape = shape
  end

  def set_color(color)
    @color = color
  end

  def set_number_of_shapes(num)
    @number_of_shapes = num
  end

  def set_fill(fill)
    @fill = fill
  end

  #getter methods
  def get_shape
    @shape
  end

  def get_color
    @color
  end

  def get_number_of_shapes
    @number_of_shapes
  end

  def get_fill
    @fill
  end

  #Return the match value of two cards
  # Any two cards could be part of the same set
  # the way to find a set of 3 with cards c1 c2 and c3 :
  # c1.check_match(c2) == c2.check_match(c3) == c1.check_match(c3)
  # The same relationships need to hold across 3 cards for each individual property
  def check_match(card)

    match_value = 0b0

    match_value += 0b1 if (@shape == card.get_shape)
    match_value *= 2

    match_value += 0b1 if(@color == card.get_color)
    match_value *= 2

    match_value += 0b1 if(@number_of_shapes == card.get_number_of_shapes)
    match_value *= 2

    match_value += 0b1if(@fill == card.get_fill)

    return match_value
  end

  #right now this is for testing purposes
  def to_string()
    puts(@fill, @number_of_shapes, @shape, @color)
  end

  def display_card 
    @number_of_shapes.times {print "#{@cardcode}\t"}
    puts ""
  end

  def set_cardCode
    case @shape
    when "Square"
      case @fill
      when "None"
        @cardcode = "\u25A1"
      when "Full"
        @cardcode = "\u25A0"
      when"Trapped"
        @cardcode = "\u25A3"
      end
    when "Circle"
      case @fill
      when "None"
        @cardcode = "\u25CB"
      when "Full"
        @cardcode = "\u25CF"
      when"Trapped"
        @cardcode = "\u25C9"
      end
    when "Diamond"
      case @fill
      when "None"
        @cardcode = "\u25C7"
      when "Full"
        @cardcode = "\u25C6"
      when"Trapped"
        @cardcode = "\u25C8"
      end
    end

    case @color
    when "Red"
      @cardcode = "\033[0;31m" + @cardcode
    when "Green"
      @cardcode = "\033[0;32m" + @cardcode
    when "Blue"
      @cardcode = "\033[0;34m" + @cardcode
    end
  
  end

end