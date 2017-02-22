require 'computer_player'

class ComputerVsComputer
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
    [ComputerPlayer.new('x'), ComputerPlayer.new('o')]
  end
end
