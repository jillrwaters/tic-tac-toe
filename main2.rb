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
  end
end

test = Board.new
puts test.display

puts test.empty_positions?

test.place_mark(8, "x")

puts test.display

test.place_mark(1,'o')
test.place_mark(2,'x')
test.place_mark(3,'o')

puts test.display

test.place_mark(4,'o')
test.place_mark(5,'o')
test.place_mark(6,'o')

test.place_mark(7,'x')
test.place_mark(9,'x')

test.display

puts test.empty_positions?



#------------------testing stuff

# require "pry-byebug" ; binding.pry







#-------------------------------



class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_move
    # Get a move from the player (i.e., a position on the board)
  end
end

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
