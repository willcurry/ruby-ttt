require 'human_vs_human'
require 'human_vs_computer'

class ModePicker
  def initialize(input = $stdin)
    @input = input
    @modes = [HumanVsHuman.new(1),
              HumanVsComputer.new(2)]
  end

  def request_mode
    requested_key = @input.gets.to_i
    @modes.find {|mode| mode.key == requested_key}
  end
end
