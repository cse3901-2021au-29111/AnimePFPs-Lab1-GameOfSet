load "card.rb"

class Deck


  #could be class or instance vars, since
  # there should only be one deck, could be changed later
  @shapes #used to generate all possible cards
  @colors#
  @fills  #
  @numbers  #
  @size    #num cards left in the deck
  @max    #num cards that were in the deck after initialization
  @cards  #this will hold the cards before dealing them to the table

  #contructs the deck, gets one of each possible card, and shuffles
  # Original plan was to have a mode, saved for future updates
  def initialize(mode)
    base_properties
    create_cards
    @max = @size = @cards.length #initizliaing these here since this should be true independent of property changes
    @size = @cards.length
    @cards.shuffle! #randomize card order
  end

  #generates the base properties, I want this to become more flexible
  def base_properties
    @shapes = ["Square", "Circle", "Diamond"]
    @colors = ["Blue", "Red",  "Green"]
    @fills = ["None", "Full", "Trapped"]
    @numbers = [1, 2, 3]
  end

  #creates the cards by each combination of properties
  def create_cards
    @cards = Array.new
    #add every combination of the base properties as card objects into the cards array
    for shape in @shapes
      for color in @colors
         for fill in @fills
            for number in @numbers
                 @cards.push(Card.new(shape, color, number, fill))
            end
         end
      end
    end
  end

  #requires that there are cards in the deck
  # any methods calling this must check that the size of
  # the instance is > 0
  def draw_card
    @size -= 1
    @cards.pop
  end

  #adds a group of cards to the deck
  # and shuffles
  # original purpose is to eat cards off the table if there's an impossible position
  # incoming_cards must be an array of cards
  def add_to_deck(incoming_cards)
    @cards.concat(incoming_cards)
    @cards.shuffle!
    @size += incoming_cards.length
  end

  #return number of cards left in the deck
  def size
    @size
  end

end




