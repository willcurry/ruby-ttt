require 'human_vs_human'
require 'human_vs_computer'
require 'computer_vs_computer'
require 'console_game'

class ModePicker
  def initialize(game_type = ConsoleGame.new)
    @game_type = game_type
    @modes = [HumanVsHuman.new(1, "Human VS Human"),
              HumanVsComputer.new(2, "Human VS Computer"),
              ComputerVsComputer.new(3, "Computer VS Computer")]
  end

  def request_mode(requested_key)
    mode = @modes.find {|mode| mode.key == requested_key}
  end
end
