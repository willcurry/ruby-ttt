class Board
  def initialize
    @board = create_board
  end

  def create_board
    Array.new(3) {Array.new(3)}
  end

  def get
    @board
  end

  def make_move(position)
    @board[position] = 'x'
  end
end
