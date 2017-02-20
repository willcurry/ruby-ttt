require_relative 'board'

class Game
  def initialize(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two
  end

  def make_move(position)
    if is_valid_position?(position) then
      @board = @board.mark(position - 1, @player_one.mark)
      rotate_turns
    else
      puts("Invalid position!")
    end
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      display_board
      make_move(gets.to_i)
    end
    display_board
  end

  private

  def is_valid_position?(position)
    position < 9 and position > 0 and @board.get[position] == '-'
  end

  def display_board
    @board.get.each_slice(3).to_a.each {|row| puts row.join(' ')}
  end

  def rotate_turns
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end

