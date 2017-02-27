require 'mode_picker'
require 'game'
require 'console_game'

class GameCreator
  def initialize(game_type = ConsoleGame.new)
    @mode_picker = ModePicker.new(game_type)
    @game_type = game_type
  end

  def create
    board_size = @game_type.ask_for_board_size
    requested_mode = @mode_picker.request_mode(@game_type.ask_for_mode)
    players = requested_mode.players
    Game.new(Board.new([], 'o', board_size), players[0], players[1])
  end
end
