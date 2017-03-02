require 'mode_registry'
require 'game'

class GameCreator
  def initialize(game_type)
    @mode_registry = ModeRegistry.new(game_type)
    @game_type = game_type
  end

  def create
    board_size = @game_type.ask_for_board_size
    requested_mode = @mode_registry.find(@game_type.ask_for_mode)
    players = requested_mode.players
    Game.new(Board.new([], 'o', board_size), players[0], players[1], @game_type)
  end
end
