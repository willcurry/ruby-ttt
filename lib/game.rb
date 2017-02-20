require 'board'

class Game
  def initialize(board)
    @board = board
    @turn = 'x'
  end

  def make_move(position)
    @board = @board.mark(position, @turn)
    rotate_turns
  end

  def is_over?
    @board.is_won? || !@board.include('-')
  end

  private

  def rotate_turns
    if @turn == 'x'
      @turn = 'o'
    else
      @turn = 'x'
    end
  end
end
