require_relative 'board'

class Game
  def initialize(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two
  end

  def make_move(position)
    @board = @board.mark(position, @player_one.mark)
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
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end

