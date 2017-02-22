require 'computer_player'

class ComputerVsComputer
  def initialize(key)
    @key = key
  end

  def key
    @key
  end

  def players
    [ComputerPlayer.new('x'), ComputerPlayer.new('o')]
  end
end
