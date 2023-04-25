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
    @current_turn = [@player_one_mark, @player_two_mark].sample # randomly pick first to play
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
    # add the move to appropriate array
    @x_marks << position if mark == 'x'
    @o_marks << position if mark == 'o'
  end

  def announce_turn
    message = ', it is your turn. Enter a number 1-9 to place your '
    puts "Player 1#{message}'#{@player_one_mark}'." if @current_turn == @player_one_mark
    puts "Player 2#{message}'#{@player_two_mark}'." if @current_turn == @player_two_mark
  end

  def choose_position
    begin
      input = gets.chomp.to_i
      if !(1..9).include?(input) || already_entered?(input)
        raise "\nERROR\nYour input is invalid. Enter a number 1-9 that has not already been entered."
      end
    rescue => e
      puts e.message
      retry
    end
    place_mark(input, @current_turn)
  end

  def place_mark(position, mark)
    # place the mark on the board in the chosen position (1-9)
    @board.each do |line|
      if line.include?(position.to_s)
        spot = line.index(position.to_s)
        line[spot] = mark.to_s
      end
    end
    record_mark(position, @current_turn)
  end

  def keep_playing?
    true if spaces_left? && !winner?
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
          puts "\nGAME OVER \n\nPlayer 1 wins!\n\n"
        elsif @player_two_mark == 'x'
          puts "\nGAME OVER \n\nPlayer 2 wins!\n\n"
        end
        exit
      elsif o_marks.sort.join.to_s.include?(combo.join.to_s)
        if @player_one_mark == 'o'
          puts "\nGAME OVER \n\nPlayer 1 wins!\n\n"
        elsif @player_two_mark == 'o'
          puts "\nGAME OVER \n\nPlayer 2 wins!\n\n"
        end
        exit
      end
    end
    false
  end

  def start_game
    puts "\nBelow is the game board. To mark a spot, enter the number where you wish to place your mark. \n\nLet the games begin! Hey-o!\n\n"
  end

  def end_game
    puts 'It\'s a tie!' if tie?
    # when nobody won but all spots are taken
  end

  def play
    start_game
    # loop methods until there is a winner or tie
    while keep_playing?
      announce_turn
      choose_position
      puts
      puts @board
      puts
      switch_player
    end
    end_game
  end
end

players = PlayerSet.new
tic_tac_toe = Game.new(players.player_one, players.player_two)

tic_tac_toe.play