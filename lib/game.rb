require 'board'
require 'game_recording'
require 'moves'
require 'input_manager'

class Game
  attr_reader :board
  attr_writer :board
  attr_reader :recording
  attr_reader :moves
  
  def initialize(board, player_one, player_two, game_type = ConsoleGame.new)
    @board = board
    @player_one, @player_two  = player_one, player_two
    @active_player = @player_one
    @game_type = game_type
    @moves = Moves.new
    @input_manager = InputManager.new(self)
  end

  def make_move(move)
    return @game_type.display_invalid_move if !@board.valid_position?(move)
    @moves.add(move)
    @board = @board.mark(move, @active_player.mark)
    update_active_player
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    until is_over?
      @game_type.display_board(@board)
      @input_manager.manage(@active_player.input(@board))
    end
    end_game
  end

  private

  def end_game
    @game_type.game_over(@board)
    @recording = GameRecording.new(@game_type, @board.dimension, @moves)
  end

  def update_active_player
    @active_player = @active_player == @player_one ? @player_two : @player_one
  end
end
