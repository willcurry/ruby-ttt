require 'human_player'

class HumanVsHuman
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
    [HumanPlayer.new('x'), HumanPlayer.new('o')]
  end
end
