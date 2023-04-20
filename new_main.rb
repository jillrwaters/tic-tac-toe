# GAME SEQUENCE:

puts "\n***WELCOME TO TIC TAC TOE***"

# 2 players per game
class PlayerSet
  attr_accessor :player_one_marks, :player_two_marks
  attr_reader :player_one, :player_two

  def initialize
    puts "\nPlayer 1, please enter x or o"
    @player_one = validate_choice(gets.chomp)
    @player_two = determine_player_two_choice(@player_one)
    puts "\nPlayer 1 has chosen #{@player_one}. Player 2 is #{@player_two}."
  end

  def validate_choice(choice)
    # get first player's choice and only accept input if it is x or o, non-case sensitive but converts to lowercase
    choice.downcase!
    if %w[x o].include?(choice)
      choice
    else
      puts "\nYou can only choose x or o, not '#{choice}'. Please start over."
      exit
    end
  end

  def determine_player_two_choice(player_one) 
    # second player is automatically x or o based on first player's choice
    if player_one == 'x'
      'o'
    else
      'x'
    end
  end
end

players = PlayerSet.new

# show the game board
class Game
  @current_turn = 'x'
  attr_accessor :board

  def initialize(player_one_mark,  player_two_mark)
    @player_one_mark = player_one_mark
    @player_two_mark = player_two_mark
    @board = ['_1_|_2_|_3_', '4_|_5_|_6_', ' 7 | 8 | 9 ']
    @winning_combinations = [[123], [456], [789], [147], [258], [369], [357], [159]]
    @x_marks = []
    @o_marks = []
  end

  def place_mark(position, mark)
    # Place a mark (X or O) on the board at the given position --
    # mark will be players.player_one or players.player_two
    @board.each do |line|
      if line.include?(position.to_s)
        spot = line.index(position.to_s)
        line[spot] = mark.upcase.to_s
      end
    end
    @x_marks << position if mark == 'x'
    @o_marks << position if mark == 'o'
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

