require 'mode_picker'
require 'game'

class GameCreator
  def initialize(input = $stdin)
    @mode_picker = ModePicker.new(input)
  end

  def create
    players = requested_mode.players
    Game.new(Board.new, players[0], players[1])
  end

  private

  def requested_mode
    @mode_picker.request_mode
  end
end
