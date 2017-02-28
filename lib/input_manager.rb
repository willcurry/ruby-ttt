require 'game'

class InputManager
  def initialize(game)
    @game = game
    @board = game.board
  end

  def is_move?(input)
    @board.available_positions.each do |position|
      return true if input == position.to_s
    end
  end
end
