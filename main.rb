# main file to run the game from
load "table.rb"
load "deck.rb"
load "card.rb"


def main
  puts("Enter '1' to start a game, enter anything else to kill the program")
  user_input = gets.to_i
  god_mode = false
  game_run = false
  if user_input == 1
    game_run = true
  elsif user_input == 3901
    game_run = true
    god_mode = true
  end
  d = Deck.new("")
  t = Table.new(d)
  game_time = Time.new.sec
  while game_run
    puts("----------------------")
    t.display_table
    puts("The current deck size is: #{d.size}, you've used #{Time.now.sec - game_time} seconds")
    puts("Please enter 3 numbers between 1-12, one at a time, to check if those cards are a set")
    nums = Array.new
    if god_mode
      until t.has_matches?
        t.shuffle(d)
      end
      nums = t.has_matches?
    else
      nums[0] = gets.to_i - 1
      nums[1] = gets.to_i - 1
      nums[2] = gets.to_i - 1
    end

    t.remove_set(nums)
    t.fill_table(d)
    unless t.has_matches?
      puts "No matches"
      if d.size == 0
        game_run = false
      else
        t.shuffle(d)
      end
    end
  end
  puts("Congrats, you win!")
end

main
