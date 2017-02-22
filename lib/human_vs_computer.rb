require 'human_player'
require 'computer_player'

class HumanVsComputer
  def initialize(key)
    @key = key
  end

  def key
    @key
  end

  def players
    [HumanPlayer.new('x'), ComputerPlayer.new('o')]
  end
end
