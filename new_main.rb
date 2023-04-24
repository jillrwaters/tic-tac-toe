# GAME SEQUENCE:

puts "\n***WELCOME TO TIC TAC TOE***"

# 2 players per game
class PlayerSet
  attr_reader :player_one, :player_two

  def initialize
    puts "\nPlayer 1, please enter x or o"
    @player_one = validate_choice(gets.chomp)
    @player_two = determine_player_two_choice(@player_one)
    puts "\nPlayer 1 has chosen #{@player_one}. Player 2 is #{@player_two}. The first turn will be determined randomly."
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
  attr_accessor :board
  attr_reader :play, :x_marks, :o_marks
  @@winning_combinations = [[123], [456], [789], [147], [258], [369], [357], [159]]

  def initialize(player_one_mark, player_two_mark)
    # use player.player_one and player.player_two
    @player_one_mark = player_one_mark
    @player_two_mark = player_two_mark
    @board = ['_1_|_2_|_3_', '_4_|_5_|_6_', ' 7 | 8 | 9 ']
    @x_marks = []
    @o_marks = []
    @current_turn = [@player_one_mark, @player_two_mark].sample
  end

  def switch_player
    # switch @current_turn to current player
    if @current_turn == @player_one_mark
      @current_turn = @player_two_mark
    elsif @current_turn == @player_two_mark
      @current_turn = @player_one_mark
    end

  end

  def record_mark(position, mark)
    # player = current player
    # user input must be number 1-9
    # add the move to appropriate array (also see place_mark)
    @x_marks << position if mark == 'x'
    @o_marks << position if mark == 'o'
  end

  def announce_turn
    # shows whose turn it is
    message = ', it is your turn. Enter a number 1-9 to place your '
    puts "Player 1#{message}'#{@player_one_mark}'." if @current_turn == @player_one_mark
    puts "Player 2#{message}'#{@player_two_mark}'." if @current_turn == @player_two_mark
    
  end

  def place_mark(position, mark)
    # position is from collect_player_move
    # mark is @player_one_mark or @player_two_mark
    @board.each do |line|
      if line.include?(position.to_s)
        spot = line.index(position.to_s)
        line[spot] = mark.to_s
      end
    end    
    
    record_mark(position, @current_turn) # if validate_position(position)
  end

  

  def keep_playing?
    true if spaces_left? && !winner?
    # are there empty spaces still on the board
    # has someone already won the game
  end

  def spaces_left?
    @board.any? { |line| line.match?(/\p{Digit}/.to_s) }
  end

  def tie?
    !spaces_left? && !winner?
  end

  def already_entered?(input)
    true if @x_marks.include?(input) || @o_marks.include?(input)
  end

  def winner?
    @@winning_combinations.each do |combo|
      if x_marks.sort.join.to_s.include?(combo.join.to_s)
        if @player_one_mark == 'x'
          puts "\nGAME OVER \n\nPlayer 1 wins!"
        elsif @player_two_mark == 'x'
          puts "\nGAME OVER \n\nPlayer 2 wins!"
        end
        exit
      elsif o_marks.sort.join.to_s.include?(combo.join.to_s)
        if @player_one_mark == 'o'
          puts "\nGAME OVER \n\nPlayer 1 wins!"
        elsif @player_two_mark == 'o'
          puts "\nGAME OVER \n\nPlayer 2 wins!"
        end
        exit
      end
    end
    false
  end

  def validate_position(num)
    if !(1..9).include?(num.to_i)
      puts "YOU CAN'T CHOOSE #{num} SILLY. Try again:"
      false
    elsif x_marks.include?(num) || o_marks.include?(num)
      puts "#{num} has already been chosen. Try again:"
      false
    else
      num
    end
  end

  def end_game
    if tie?
      puts 'It\'s a tie!'
    else
      puts 'This game is over'
    end
    # show which player has winning combination or announce tie
    # end game
  end

  def play
    # loop methods until there is a winner or tie
    
    while keep_playing?
      announce_turn
      # ask again and keep asking until they enter a valid position
      begin
        input = gets.chomp
      rescue validate_position(input)
        retry
      end
      place_mark(input, @current_turn)
      puts "\n"
      puts @board
      puts "\n\nx's choices: #{x_marks}\n\no's choices: #{o_marks}\n"
      switch_player
      
    end
    # require 'pry-byebug' ; binding.pry
    end_game
  end
end

puts "\nBelow is the game board. To mark a spot, enter the number where you wish to place your mark. Let the games begin! Hey-o!"
puts "\n"

tic_tac_toe = Game.new(players.player_one, players.player_two)
puts tic_tac_toe.board
puts "\n"

tic_tac_toe.play
puts "---"
puts tic_tac_toe.x_marks
puts "---"
puts tic_tac_toe.o_marks



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

