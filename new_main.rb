# GAME SEQUENCE:

puts "\n***WELCOME TO TIC TAC TOE***"

# 2 players per game
class PlayerSet
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

# show/manipulate the game board based on player turns, check for and announce winner
class Game
  @current_turn = @player_one_mark
  attr_accessor :board

  def initialize(player_one_mark, player_two_mark)
    # use player.player_one and player.player_two
    @player_one_mark = player_one_mark
    @player_two_mark = player_two_mark
    @board = ['_1_|_2_|_3_', '4_|_5_|_6_', ' 7 | 8 | 9 ']
    @winning_combinations = [[123], [456], [789], [147], [258], [369], [357], [159]]
    @x_marks = []
    @o_marks = []
  end

  def collect_player_move(player)
    # player = current player
    # user input must be number 1-9
    # add the move to appropriate array (also see place_mark)
  end

  def announce_turn
    # shows whose turn it is
  end

  def place_mark(position, mark)
    # position is from collect_player_move
    # mark is @player_one_mark or @player_two_mark
    @board.each do |line|
      if line.include?(position.to_s)
        spot = line.index(position.to_s)
        line[spot] = mark.upcase.to_s
      end
    end
    # move to collect_player_move?
    @x_marks << position if mark == 'x'
    @o_marks << position if mark == 'o'
  end

  def switch_player
    # switch @current_turn to current player
  end

  def keep_playing?
    # are there empty spaces still on the board
    # has someone already won the game
    # is there a tie
  end

  def winner?
    # do either of the marks arrays contain a winning combination in any order
  end

  def announce_winner
    # show which player has winning combination or announce tie
    # end game
  end

  def play
    # loop methods until there is a winner or tie
  end
end

puts "\nBelow is the game board. To mark a spot, enter the number where you wish to place your mark. Let the games begin! Hey-o!"
puts "\n"

tic_tac_toe = Game.new(players.player_one, players.player_two)
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

