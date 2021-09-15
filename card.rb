
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

  #Check if two cards have all matching elements
  def check_match(card)
    (@shape == card.get_shape) && (@color == card.get_color) &&
      (@number_of_shapes == card.get_number_of_shapes) && (@fill == card.get_fill)
  end

  #check if two cards have no matching elements
  def check_no_match(card)
    (@shape != card.get_shape) && (@color != card.get_color) &&
      (@number_of_shapes != card.get_number_of_shapes) && (@fill != card.get_fill)
  end


end


