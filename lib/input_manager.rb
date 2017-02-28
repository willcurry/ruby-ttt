require 'game'

class InputManager
  def initialize(game)
    @game = game
    @board = game.board
  end

  def manage(input)
    return @game.make_move(input.to_i) if is_move?(input)
    return @game.undo if is_command?(input)
  end

  def is_move?(input)
    @board.available_positions.each do |position|
      return true if input.to_i == position && input.include?(position.to_s)
    end
    false
  end

  def is_command?(input)
    input.include?("undo")
  end
end
