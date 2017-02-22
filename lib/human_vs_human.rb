require 'human_player'

class HumanVsHuman
  def initialize(key)
    @key = key
  end

  def key
    @key
  end

  def players
    [HumanPlayer.new('x'), HumanPlayer.new('o')]
  end
end
