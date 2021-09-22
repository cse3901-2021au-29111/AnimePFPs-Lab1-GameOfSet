
load "deck.rb"

class Table

  @table_max #maximum cards displayed at a time
  @table_size #current # of cards on table
  @cards_showing #the cards on the table
  @user_warnings #series of warnings to the user
  @user_mistakes #how many incorrect inputs the user has made

  #pass in a deck object on the constructor
  # to fill the table
  def initialize(deck)
    @cards_showing = Array.new
    base#just like the deck I want this to be adaptable if we can
    @table_max.times {@cards_showing.push(deck.draw_card)}
    @table_size = @cards_showing.length
    set_warnings
  end

  def set_warnings
    @user_warnings = ["Please Read the instructions Carefully", "Please be careful, bad inputs break code",
                      "Are you playing this game because it uses shapes instead of words?",
                      "What is your major malfunction?!", "Final warning"]
    @user_mistakes = 0
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
    loc = 1
    for card in @cards_showing
      print ("\e[0m#{loc}".ljust(8, " ") + "#{card.display_card}" + " ".ljust(20, " "))
      loc += 1
      puts "" if (loc % 2 != 0) || (loc == (@table_size + 1) && @table_size != @table_max)
    end

    print "\e[0m"
  end

  def check_set(pos1, pos2, pos3)

    mv1 = @cards_showing[pos1].check_match(@cards_showing[pos2])
    mv2 = @cards_showing[pos1].check_match(@cards_showing[pos3])
    mv3 = @cards_showing[pos2].check_match(@cards_showing[pos3])

    (mv1 == mv2) && (mv2 == mv3)

  end

  #checks if all incoming values are integers in the valid range of 0-11
  def valid?(pos)

    return false if pos[1] == pos[2] || pos[2] == pos[3] || pos[1] == pos[3]
    for index in pos
      return false unless (index.is_a? Integer) && index >= 0 && index <= 11
    end
    return true
  end

  #checks if a set is removable, and if so removes them returns
  # false if not removable
  def remove_set(pos)

    #enough invalid inputs makes the game end
    unless valid?(pos)
      if @user_mistakes < @user_warnings.length
          puts @user_warnings[@user_mistakes]
          @user_mistakes += 1
          return false
      else
        abort("Seriously Man?")
      end
    end

    #return 0 if not a set
    unless check_set(pos[0], pos[1], pos[2])
      puts "Not a set!"
      return false
    end
    pos.sort      #makes sure to delete in descending order
    pos.reverse!
    for i in 0..2
      @cards_showing.delete_at(pos[i])
    end
    @table_size -= 3
    puts "That was a set!"

    return true
  end

  #Compares 3 cards, removes them if they are a set, or outputs a message telling the user they were not a valid set
  # assumes that there are no duplicate numbers in nums
  #def remove_set(nums,deck)
  #  nums.sort
  #  c0 = @cards_showing[nums[0]]
  #  c1 = @cards_showing[nums[1]]
  #  c2 = @cards_showing[nums[2]]
  #  comp1 = c0.check_match(c1)
  #  comp2 = c1.check_match(c2)
  ##  comp3 = c0.check_match(c2)
  #  if (comp1 == comp2) && (comp1 == comp3)
  #    @cards_showing.delete_at(nums[0])
  #    nums[1] -= 1
  #    @cards_showing.delete_at(nums[1])
  #    nums[2] -= 2
  #    @cards_showing.delete_at(nums[2])
  #    3.times {@cards_showing.push(deck.draw_card)}   Doesn't check that the deck has cards
  #  else
  #    puts("Sorry, that was not a valid match. Try again.")
  #  end
  #end

  #Checks if there are any matches of cards on the table
  def has_matches?
    #iterate over cards_showing to determine if there exist any sets on the table.
    # continue statement skips the loop if it is iterating through the same element in the outer loop.
    for c1 in @cards_showing
      for c2 in @cards_showing
        next if c1 == c2
        for c3 in @cards_showing
          next if c1 == c3 || c2 == c3
          is_set = c1.check_match(c2) == c2.check_match(c3) && c2.check_match(c3)== c1.check_match(c3)
          #return true if is_set
          return [@cards_showing.index(c1), @cards_showing.index(c2), @cards_showing.index(c3)] if is_set
        end
      end
    end

    #return 0 if no set is found.
    return false
  end

  #puts cards onto the table
  # updates size the table
  def fill_table(deck)
    while @table_size < @table_max
      if deck.size == 0
        puts "deck empty"
        break
      else
        @cards_showing.push(deck.draw_card)
        @table_size += 1
      end
    end
  end


  #Shuffles the current table into the deck, then redraws to table_max cards
  def shuffle(d)
    puts "Reshuffling"
    d.add_to_deck(@cards_showing)
    @cards_showing.clear
    @table_max.times {@cards_showing.push(d.draw_card)}
    @table_size = @cards_showing.length
  end

end
