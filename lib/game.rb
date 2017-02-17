require 'board'

class Game
  def initialize(board)
    @board = board
    @turn = 'x'
  end


  def make_move(position)
    @board.mark(position, @turn)
    rotate_turns
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
