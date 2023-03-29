class Player
  attr_accessor :get_move, :name

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

test_player = Player.new

puts test_player.name

class Game
  def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
 end

 def play
   #play until winner or tie
 end

  private

 def switch_players
   # Switch between the two players after each move
 end
end

class Board
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def detect_winner
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
      [0, 4, 8], [2, 4, 6] # diagonal
    ]

    winning_combinations.each do |combo|
      if board[combo[0]] != "" &&
         board[combo[0]] == board[combo[1]] &&
         board[combo[1]] == board[combo[2]]
        return board[combo[0]]
      end
    end

    return nil
  end
end