require_relative 'board'

class Game
  def initialize(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two
  end

  def board
    @board.get
  end

  def make_move
    move = @player_one.next_move - 1 
    if @board.valid_position?(move)
      @board = @board.mark(move, @player_one.mark)
      rotate_turns
    else
      puts "Invalid position!"
    end
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      display_board
      make_move
    end
    display_board
  end

  private

  def display_board
    @board.get.each_slice(3).to_a.each {|row| puts row.join(' ')}
  end

  def rotate_turns
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end

