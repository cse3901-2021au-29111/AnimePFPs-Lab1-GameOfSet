
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

  def display_table
    for card in @cards_showing
      card.display_card
    end
  end

  def check_set(pos1, pos2, pos3)

    mv1 = @cards_showing[pos1].check_match(@cards_showing[pos2])
    mv2 = @cards_showing[pos1].check_match(@cards_showing[pos3])
    mv3 = @cards_showing[pos2].check_match(@cards_showing[pos3])

    (mv1 == mv2) && (mv2 == mv3)

  end

  #checks if a set is removable, and if so removes them returns
  # false if not removable
  def remove_set(pos)

    #return 0 if not a set
    if !check_set(pos[0], pos[1], pos[2])
      return false
    end

    pos.sort!
    pos.reverse!
    for i in 0..2
      pos.delete_at(pos[i])
    end

  end

  def shuffle(d)
    d.add_to_deck(@cards_showing)
    @table_max.times {@cards_showing.push(d.draw_card)}
    @table_size = @cards_showing.length
  end

end
