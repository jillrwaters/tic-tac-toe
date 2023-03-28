class Board
  attr_reader :place_mark, :empty_positions
  @@board = ["_1_|_2_|_3_",
             "_4_|_5_|_6_",
             " 7 | 8 | 9 "]

  

  def initialize
    # Initialize an empty board
    @@board
  end

  def display
    puts @@board
  end

  def place_mark(position, mark)
    # Place a mark (X or O) on the board at the given position -- Player.mark
    @@board.each do |line|
      if line.include?("#{position}")
        spot = line.index("#{position}")
        line[spot] = "#{mark.upcase}"
      end
    end
  end

  def empty_positions?
    # Check if there are any empty positions left on the board
    @@board.any? { |line| line.match?("#{/\p{Digit}/}") }
  end

  def winner
    # Check if there is a winner (X or O) on the board
    # Convert the board to a 2D array
board = board.map { |row| row.gsub('_', ' ').split(' | ') }

# Check all possible winning combinations
winning_combinations = [
  [0, 0, 0, 1, 0, 2], # top row
  [1, 0, 1, 1, 1, 2], # middle row
  [2, 0, 2, 1, 2, 2], # bottom row
  [0, 0, 1, 0, 2, 0], # left column
  [0, 1, 1, 1, 2, 1], # middle column
  [0, 2, 1, 2, 2, 2], # right column
  [0, 0, 1, 1, 2, 2], # top-left to bottom-right diagonal
  [0, 2, 1, 1, 2, 0]  # top-right to bottom-left diagonal
]

winning_combinations.each do |combo|
  marks = combo.map { |row, col| board[row][col] }
  if marks.uniq.length == 1 && marks[0] != " "
    puts "The winner is #{marks[0]}!"
    break
  end
end
  end

  def tie?
    # Check if all the spaces are full but there is no winner
  end
end

#------------------testing stuff

# require "pry-byebug" ; binding.pry
# test = Board.new
# puts test.display

# puts test.empty_positions?

# test.place_mark(8, "x")

# puts test.display

# test.place_mark(1,'o')
# test.place_mark(2,'x')
# test.place_mark(3,'o')

# puts test.display

# test.place_mark(4,'o')
# test.place_mark(5,'o')
# test.place_mark(6,'o')

# test.place_mark(7,'x')
# test.place_mark(9,'x')

# test.display

# puts test.empty_positions?

#-------------------------------

class Player
  attr_accessor :get_move

  def initialize(name="player", mark="x/o")
    puts "Please enter the player's name:"
    @name = gets.chomp
    puts "Please choose x or o:"
    @mark = gets.chomp

    puts "Welcome to Tic-Tac-Toe, #{@name}!. You have chosen #{@mark} as your marker."
  end

  def get_move
    # Get a move from the player (i.e., a position on the board)
    puts "#{@name}: please enter a number from the board to mark a spot."
    gets.chomp
  end
end

#------------------testing stuff

# require "pry-byebug" ; binding.pry

test_player = Player.new
test_player2 = Player.new

#-------------------------------

class Game
  def initialize(player1, player2)
    # Initialize a new game with two players
  end

  def play
    # Play the game until there is a winner or a tie
  end

  private

  def switch_players
    # Switch between the two players after each move
  end
end
