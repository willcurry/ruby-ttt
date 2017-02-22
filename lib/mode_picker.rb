require 'human_player'
require 'human_vs_human'

class ModePicker
  def initialize(input = $stdin)
    @input = input
    @modes = [HumanVsHuman.new(1)]
  end

  def request_mode
    requested_key = @input.gets.to_i
    @modes.find {|mode| mode.key == requested_key}
  end
end
