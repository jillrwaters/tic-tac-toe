class Player
  attr_reader :name
  attr_accessor :choice
  @@player_info = [@name, @choice]

  def initialize(name=gets.chomp)
    @name = name
  end

  def x_or_o
    puts "#{@name}, please choose x or o."
    @choice = gets.chomp.downcase
    
    puts "#{self.name} has chosen #{@choice}." 
    return @choice
  end

end



class Game
  @@board = ["_1_|_2_|_3_",
             "_4_|_5_|_6_",
             " 7 | 8 | 9 "]

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    puts @@board
  end

  def new_board
    @@board
  end

  def choices
    if player1.choice == "x"
      player2.choice = "o"
      puts "#{player2.name} will be #{player2.choice}"
    elsif player1.choice == 'o'
      player2.choice == 'x'
      puts "#{player2.name} will be #{player2.choice}"
    else
      puts "error"
    end
  end
end



puts "Please enter a name for Player 1:"
player1 = Player.new
puts "Welcome to the game, #{player1.name}."

puts "Please enter a name for Player 2:"
player2 = Player.new
puts "Welcome to the game, #{player2.name}."

player1.x_or_o

Game.new(player1.name, player2.name)






