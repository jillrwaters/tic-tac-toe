# GAME SEQUENCE:

# ask first player if they are x or o
def get_player_one_choice
  puts "Player 1, would you like to be X or O?"
  answer = gets.chomp
  return answer.upcase!

  # error handling -- player must input only x or o, not case sensitive. then convert to caps
  #look up - error handling - how to start function over if necessary


end



# second player is automatically x or o
def get_player_two_choice
  if get_player_one_choice == 'X' 
    return 'O'
  else 
    return 'X'
  end

end

def show_choices
  puts "Player 1 has chosen #{get_player_one_choice}, so Player 2 is #{get_player_two_choice}."
end


get_player_two_choice
show_choices

# show the game board

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


