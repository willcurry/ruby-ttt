require 'computer_player'

module Modes
  class ComputerVsComputer
    def initialize
      @key = 3
      @name = "Computer VS Computer"
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
end
