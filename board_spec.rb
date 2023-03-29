require_relative 'board'

RSpec.describe Board do
  context 'when there is no winner' do
    it 'returns nil' do
      board = Board.new(['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'])
      expect(board.detect_winner).to be_nil
    end
  end
  
  context 'when there is a horizontal winner' do
    it 'returns X' do
      board = Board.new(['X', 'X', 'X', 'O', 'O', '', '', '', ''])
      expect(board.detect_winner).to eq('X')
    end

    it 'returns O' do
      board = Board.new(['', '', '', 'O', 'O', 'O', 'X', '', 'X'])
      expect(board.detect_winner).to eq('O')
    end
  end

  context 'when there is a vertical winner' do
    it 'returns X' do
      board = Board.new(['X', 'O', 'X', '', 'O', 'X', '', '', 'X'])
      expect(board.detect_winner).to eq('X')
    end

    it 'returns O' do
      board = Board.new(['O', '', 'X', 'O', '', 'X', '', '', 'X'])
      expect(board.detect_winner).to eq('X')
    end
  end

  context 'when there is a diagonal winner' do
    it 'returns X' do
      board = Board.new(['X', '', 'O', '', 'X', 'O', 'O', '', 'X'])
      expect(board.detect_winner).to eq('X')
    end

    it 'returns O' do
      board = Board.new(['', '', 'O', '', 'O', 'X', 'O', '', ''])
      expect(board.detect_winner).to eq('O')
    end
  end
end
