require 'board'
require 'game_recording'
require 'moves'
require 'command_manager'

class Game
  attr_accessor :board
  attr_reader :recording
  attr_reader :moves
  attr_accessor :active_player
  
  def initialize(board, player_one, player_two, game_type)
    @board = board
    @player_one, @player_two = player_one, player_two
    @active_player = @player_one
    @game_type = game_type
    @moves = Moves.new
    @command_manager = CommandManager.new(self)
  end

  def make_move(move)
    return @game_type.display_invalid_move if !@board.valid_position?(move)
    @moves.add(move)
    @board = @board.mark(move, @active_player.mark)
    update_active_player
    handle_input if @active_player.kind_of?(ComputerPlayer) || @active_player.kind_of?(ActorPlayer)
    @game_type.end_game if is_over?
  end

  def is_over?
    @board.is_won? || @board.has_draw?
  end

  def start
    @game_type.start(self)
  end

  def handle_input
    @command_manager.manage(@active_player.input(@board).to_s)
  end

  def end
    @recording = GameRecording.new(@game_type, @board.dimension, @moves)
  end

  private

  def update_active_player
    @active_player = @active_player == @player_one ? @player_two : @player_one
  end
end
