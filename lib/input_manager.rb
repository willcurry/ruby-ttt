require 'game'

class InputManager
  def initialize(game)
    @game = game
    @board = game.board
  end

  def manage(input)
    return @game.make_move(input.to_i) if is_move?(input)
  end

  def is_move?(input)
    @board.available_positions.each do |position|
      return true if input == position.to_s
    end
  end

  def is_command?(input)
    input == "undo"
  end
end
