require 'human_vs_human'
require 'human_vs_computer'
require 'computer_vs_computer'
require 'console_game'

class ModePicker
  def initialize(game_type = ConsoleGame.new)
    @game_type = game_type
    @modes = find_modes
  end

  def request_mode(requested_key)
    mode = @modes.find {|mode| mode.key == requested_key}
  end

  def find_modes
    modes = []
    Modes.constants.each do |mode|
      modes << get_class(mode)
    end
    modes
  end
  
  private

  def get_class(mode)
    Object.const_get("Modes::#{mode}").new
  end
end
