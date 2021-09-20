
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
      card.present_card()
      puts("")
    end
  end

  def remove_set(nums)
    #remove all (only 1 if cards are unique) the occurrences of nums in @cards_showing
    @cards_showing.difference(nums)
  end

  def has_matches
    #iterate over cards_showing to determine if there exist any sets on the table.
    # continue statement skips the loop if it is iterating through the same element in the outer loop.
    for c1 in @cards_showing
      for c2 in @cards_showing
        continue if c1 == c2
        for c3 in @cards_showing
          continue if c1 == c3 || c2 == c3
          is_set = c1.check_match(c2) == c2.check_match(c3) && c2.check_match(c3 )== c1.check_match(c3)
          #return 1 if is_set is true.
          return 1 if is_set
        end
      end
    end
    #return 0 if no set is found.
    0
  end

  def shuffle(d)
    d.add_to_deck(@cards_showing)
    @table_max.times {@cards_showing.push(d.draw_card)}
    @table_size = @cards_showing.length
  end
end