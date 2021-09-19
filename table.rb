
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

  #Prints out each card that's on the table to the console
  def display_table
    loc = 0
    for card in @cards_showing
      print("#{loc}")
      card.present_card()
      loc += 1
      print("\033[39;49m")
    end
  end

  #Compares 3 cards, removes them if they are a set, or outputs a message telling the user they were not a valid set
  # assumes that there are no duplicate numbers in nums
  # (Needs done), nums is an array of 3 numbers corresponding to the location of a card in cards_showing
  # d is the deck to draw from
  def remove_set(nums)
    0
  end

  #Checks if there are any matches of cards on the table
  # (Needs Done), basically check every possible combination of cards on the table
  # if there are zero matches then return 0, else return 1(should try and use a break to kill the loop if one is found)
  def has_matches
    1
  end

  #Shuffles the current table into the deck, then redraws to table_max cards
  # (Might need fixed, check after every other method is implemented)
  def shuffle(d)
    d.add_to_deck(@cards_showing)
    @table_max.times {@cards_showing.push(d.draw_card)}
    @table_size = @cards_showing.length
  end
end