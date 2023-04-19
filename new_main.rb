# GAME SEQUENCE:

puts "\n***WELCOME TO TIC TAC TOE***"

class PlayerSet # 2 players per game
  attr_accessor :player_one_marks, :player_two_marks
  attr_reader :player_one_choice, :player_two_choice

  def initialize
    puts "\nPlayer 1, please enter x or o"
    @player_one_choice = validate_choice(gets.chomp)
    @player_two_choice = determine_player_two_choice(@player_one_choice)
    puts "\nPlayer 1 has chosen #{@player_one_choice}. Player 2 is #{@player_two_choice}."
    @player_one_marks = []
    @player_two_marks = []
  end

  def validate_choice(choice) # get first player's choice and only accept input if it is x or o, non-case sensitive but converts to lowercase
    choice.downcase!
    if choice == 'x' || choice == 'o'
      return choice
    else
      puts "\nYou can only choose x or o, not '#{choice}'. Please start over."
      exit
    end
  end

  def determine_player_two_choice(player_one_choice) # second player is automatically x or o based on first player's choice
    if player_one_choice == 'x'
      return "o"
    else
      return "x"
    end
  end

end

players = PlayerSet.new


# show the game board
class Game
  attr_accessor :board

  def initialize
    @board = ["_1_|_2_|_3_",
      "_4_|_5_|_6_",
      " 7 | 8 | 9 "]
  end

  def place_mark(position, mark)
    # Place a mark (X or O) on the board at the given position -- 
    # players.player_one_choice or players.player_two_choice
    @board.each do |line|
      if line.include?("#{position}")
        spot = line.index("#{position}")
        line[spot] = "#{mark.upcase}"
      end
    end
  end

  def switch_player

  end

  def keep_playing?

  end

  def has_winner?

  end

  def announce_winner

  end


end


puts "\nBelow is the game board. To mark a spot, enter the number where you wish to place your mark. Let the games begin! Hey-o!"
puts "\n"


tic_tac_toe = Game.new
puts tic_tac_toe.board
puts "\n"



# ask first player to choose a number to mark a spot

# mark that spot with x or o by changing the number to x or o and add the number to their choices array

# ask second player to choose a number to mark a spot

# mark that spot with x or o by changing the number to x or o and add the number to their choices array

# check to see if either or both of the choice arrays are at least 3 in length

# if either choice array is at least 3 in length, check for a winner

# CHECKING FOR WINNER: 

# there are 8 possible winning combinations

# if a choice array has one of the winning combinations, in any order, that player is declared winner and a 'game over, x/o wins' message appears

# if all of the spaces are full and there are no winners, 'game over, tie' message appears


