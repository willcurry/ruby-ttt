require 'mode_picker'
require 'game'
require 'console_game'

class GameCreator
  def initialize(input = $stdin, game_type = ConsoleGame.new)
    @input = input
    @mode_picker = ModePicker.new(game_type)
    @game_type = game_type
  end

  def create
    players = requested_mode.players
    Game.new(Board.new, players[0], players[1])
  end

  private

  def requested_mode
    @mode_picker.request_mode(@input.gets.to_i)
  end
end
