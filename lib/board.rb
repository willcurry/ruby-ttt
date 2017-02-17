class Board
  def initialize
    @board = create_board
    @turn = 'x'
  end

  def create_board
    Array.new(3) {Array.new(3)}
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
end
