class Player
  attr_accessor :get_move, :name, :mark

  def initialize(name="player", mark="x/o")
    puts "Please enter the player's name:"
    @name = gets.chomp
    @name[0] = @name[0].upcase
    puts "Please choose x or o:"
    @mark = gets.chomp
    puts "Welcome to Tic-Tac-Toe, #{@name}!. You have chosen #{@mark.upcase} as your marker."
  end

  def get_move
    # Get a move from the player (i.e., a position on the board)
    puts "#{@name}: please enter a number from the board to mark a spot."
    gets.chomp
  end
end
#-------
# player1 = Player.new
# player2 = Player.new
#-------
class Board
  attr_reader :board, :winner, :place_mark

  def initialize
    @board = ["_1_|_2_|_3_",
      "_4_|_5_|_6_",
      " 7 | 8 | 9 "]
  end

  def empty_positions?
    # Check if there are any empty positions left on the board
    @board.any? { |line| line.match?("#{/\p{Digit}/}") }
  end

  def place_mark(position, mark)
    # Place a mark (X or O) on the board at the given position -- Player.mark
    @board.each do |line|
      if line.include?("#{position}")
        spot = line.index("#{position}")
        line[spot] = "#{mark.upcase}"
      end
    end
  end

  def winner
    # Check if there is a winner (X or O) on the board
    # Convert the board to a 2D array
  board = @board.map { |row| row.gsub('_', ' ').split(' | ') }

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
end
#-------
# test = Board.new
# puts test.board
#-------
class Game
  attr_reader :play

  def initialize(player1=Player.new, player2=Player.new)
   @player1 = player1
   @player2 = player2
   @board = Board.new
 end

 def play
  empty_board = false
   #play until winner or tie
  puts @board.board #display board before game
  while @board.empty_positions?
    @board.place_mark(@player1.get_move, @player1.mark)
    puts @board.board #display board with player1 mark
    @board.place_mark(@player2.get_move, @player2.mark)
    puts @board.board #display board with player2 mark
  end

  puts @board.winner
 end

end

tictactoe = Game.new
tictactoe.play

