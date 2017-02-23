require 'human_player'
require 'computer_player'

module Modes
  class HumanVsComputer
    def initialize
      @key = 2
      @name = "Human VS Computer"
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
end
