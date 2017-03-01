require 'board'
require 'game_recording'
require 'moves'
require 'input_manager'

class Game
  attr_reader :board
  attr_reader :recording
  
  def initialize(board, player_one, player_two, game_type = ConsoleGame.new)
    @board = board
    @player_one, @player_two  = player_one, player_two
    @game_type = game_type
    @moves = Moves.new
    @input_manager = InputManager.new(self)
  end

  def undo
    @moves.undo
    @undone_board = @board
    @board = @board.previous
  end

  def redo
    @moves.redo
    @board = @undone_board
  end

  def make_move(move)
    return @game_type.display_invalid_move if !@board.valid_position?(move)
    @moves.add(move)
    @board = @board.mark(move, @player_one.mark)
    rotate_turns
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      @game_type.display_board(@board)
      @input_manager.manage(@player_one.input(@board))
    end
    end_game
  end

  private

  def end_game
    @game_type.game_over(@board)
    @recording = GameRecording.new(@game_type, @board.dimension, @moves)
  end

  def rotate_turns
    temp = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end
