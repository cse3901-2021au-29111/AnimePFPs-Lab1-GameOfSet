# main file to run the game from
load "table.rb"
load "deck.rb"
load "card.rb"

def main
  
  puts("Enter '1' to start a game, enter anything else to kill the program")
  user_input = gets.to_i
  game_run = 0
  if user_input == 1
    puts("hi")
    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC) #starts the game timer
    game_run = 1
    end
  d = Deck.new("")
  t = Table.new(d)
  while game_run == 1
    puts("----------------------")
    t.display_table
    puts("The current deck size is: #{d.size}")
    puts("Please enter 3 numbers between 0-11, one at a time, to check if those cards are a set")
    nums = Array.new
    nums[0] = gets.to_i
    nums[1] = gets.to_i
    nums[2] = gets.to_i
    t.remove_set(nums)
    if t.has_matches == 0
      if d.size == 0
        game_run = 0
      end
    else
      t.shuffle(d)
    end
  end

  ending = Process.clock_gettime(Process::CLOCK_MONOTONIC) #ends game timer
  elapsed = ending - starting #Calculates duration of game in seconds
  puts("Congrats, you win! It took you #{elapsed} seconds.")
end

main
