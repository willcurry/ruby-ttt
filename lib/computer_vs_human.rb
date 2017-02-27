require 'computer_player'
require 'human_player'

module Modes
  class ComputerVsHuman
    def initialize
      @key = 4
      @name = "Computer VS Human"
    end

    def name
      @name
    end

    def key
      @key
    end

    def players
      [ComputerPlayer.new('x'), HumanPlayer.new('o')]
    end
  end
end
