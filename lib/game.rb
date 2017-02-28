require 'board'
require 'game_recording'
require 'moves'

class Game
  attr_reader :board
  attr_reader :recording
  
  def initialize(board, player_one, player_two, game_type = ConsoleGame.new)
    @board = board
    @player_one, @player_two  = player_one, player_two
    @game_type = game_type
    @moves = Moves.new
  end

  def make_move
    move = @player_one.next_move(@board)
    if @board.valid_position?(move)
      @moves.add(move)
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
      @game_type.display_board(@board)
      make_move
    end
    end_game
  end

  private

  def end_game
    @game_type.game_over(@board)
    @recording = GameRecording.new(@game_type, @board.dimension, @moves.get)
  end

  def rotate_turns
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end
