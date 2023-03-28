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
