require_relative 'board'

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
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      display_board
      make_move(gets.to_i)
    end
  end

  private

  def display_board
    puts @board.get
  end

  def rotate_turns
    if @turn == 'x'
      @turn = 'o'
    else
      @turn = 'x'
    end
  end
end

