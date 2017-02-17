class Board
  def initialize
    @board = create_board
    @turn = 'x'
  end

  def create_board
    ['-', '-', '-', '-', '-', '-', '-', '-', '-']
  end

  def get
    @board
  end

  def make_move(position)
    @board[position] = @turn
    rotate_turns
  end

  def rotate_turns
    @turn = 'x' if @turn == 'o'
    @turn = 'o' if @turn == 'x'
  end

  def is_won
    rows = @board.each_slice(3).to_a
    rows.each do |row|
      return true if !row.include?('-') && contains_same(row)
    end
    false
  end

def contains_same(row)
    row.uniq.length != row.length
  end
end
