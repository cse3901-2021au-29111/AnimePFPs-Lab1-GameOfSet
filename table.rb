
load "deck.rb"

class Table

  @table_max #maximum cards displayed at a time
  @table_size #current # of cards on table
  @cards_showing #the cards on the table


  #pass in a deck object on the constructor
  # to fill the table
  def initialize(deck)
    @cards_showing = Array.new
    base#just like the deck I want this to be adaptable if we can
    @table_max.times {@cards_showing.push(deck.draw_card)}
    @table_size = @cards_showing.length

  end

  #add a card to the playing field
  #requires table_size < table max
  def add_card(c)
    @cards_showing.push(c)
    @table_size += 1
  end




  def base
    @table_max = 12
  end

  def get_table_max
    @table_max
  end

  def get_size
    @table_size
  end

  def present_cards(rowLength)
    for thisCard in cards_showing
      cardCode = check_cards(thisCard)
      case thisCard.colors
      when "Red"
        cardCode = "\033[0;31m" + cardCode
      when "Green"
        cardCode = "\033[0;32m" + cardCode
      when "Blue"
        cardCode = "\033[0;34m" + cardCode
      end

      case thisCard.numbers
      when 1
        puts "   " + cardCode + "   \t"
      when 2
        puts " " + cardCode + "   " + cardCode + " \t"
      when 3
        puts " " +cardCode + " " + cardCode + " " + cardCode + " \t"
      end
    end

  end

  def check_cards(thisCard)
    case thisCard.shapes
    when "Square"
      case thisCard.fills
      when "None"
        return "\u25A1"
      when "Full"
        return "\u25A0"
      when"Trapped"
        return "\u25A3"
      end
    when "Circle"
      case thisCard.fills
      when "None"
        return "\u25CB"
      when "Full"
        return "\u25CF"
      when"Trapped"
        return "\u25C9"
      end
    when "Diamond"
      case thisCard.fills
      when "None"
        return "\u25C7"
      when "Full"
        return "\u25C6"
      when"Trapped"
        return "\u25C8"
      end
    end   
  end

end

d = Deck.new("")
t = Table.new(d)
puts d.size
