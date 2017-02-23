require 'human_player'

module Modes
  class HumanVsHuman
    def initialize
      @key = 1
      @name = "Human VS Human"
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
end
