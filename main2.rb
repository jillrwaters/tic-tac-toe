class Board
  attr_reader :board, :place_mark
  @@board = ["_1_|_2_|_3_",
             "_4_|_5_|_6_",
             " 7 | 8 | 9 "]

  def initialize
    # Initialize an empty board
    @@board
  end

  def place_mark(position, mark)
    # Place a mark (X or O) on the board at the given position -- Player.mark
    @@board.each do |line|
      if line.include?("#{position}")
        spot = line.index("#{position}")
        line[spot] = "#{mark.upcase}"
      end
    end
     puts @@board
    
  end

  def empty_positions?
    # Check if there are any empty positions left on the board
  end

  def winner
    # Check if there is a winner (X or O) on the board
  end
end

test = Board.new
puts test.board



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
