require 'human_player'
require 'computer_player'

class HumanVsComputer
  def initialize(key, name)
    @key = key
    @name = name
  end

  def name
    @name
  end

  def key
    @key
  end

  def players
    [HumanPlayer.new('x'), ComputerPlayer.new('o')]
  end
end
