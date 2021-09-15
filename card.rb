
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

  #constructor
  def initialize(shape, color, number, fill)

    set_shape(shape)
    set_fill(fill)
    set_number_of_shapes(number)
    set_color(color)

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

    match_value = 0

    match_value += 1 if (@shape == card.get_shape)
    match_value *= 10

    match_value += 1 if(@color == card.get_color)
    match_value *= 10

    match_value += 1 if(@number_of_shapes == card.get_number_of_shapes)
    match_value *= 10

    match_value += 1if(@fill == card.get_fill)

    return match_value
  end




end


#a = Card.new("sqaure", "blue", 5, "full")
#x = Card.new("sqaure", "blue", 5, "full")
#y = Card.new("sqaure", "blue", 5, "full")
#z = Card.new("sqaure", "blue", 5, "full")
#puts a.get_color
#puts (x.check_match(y) == x.check_match(z) && x.check_match(y)== y.check_match(z))
