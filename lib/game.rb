require 'board'

class Game
  def initialize(board, player_one, player_two, game_type = ConsoleGame.new)
    @board = board
    @player_one = player_one
    @player_two = player_two
    @game_type = game_type
  end

  def board
    @board.get
  end

  def make_move
    move = @player_one.next_move(@board) - 1 
    if @board.valid_position?(move)
      @board = @board.mark(move, @player_one.mark)
      rotate_turns
    else
      @game_type.display_invalid_move
    end
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      @game_type.display_board(@board.get)
      make_move
    end
    @game_type.display_board(@board.get)
    @game_type.display_winner(@player_two)
  end

  private

  def rotate_turns
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end
