require 'game'
require 'undo'
require 'redo'

class InputManager
  def initialize(game)
    @game = game
    @undone_boards = []
    @undo = Undo.new(game)
    @redo = Redo.new(game)
  end

  def manage(input)
    return @game.make_move(input.to_i) if is_move?(input)
    if is_undo_command?(input) 
      @undone_boards << @game.board
      @undo.run
    end
    if is_redo_command?(input) 
      @redo.give_boards(@undone_boards)
      @redo.run
    end
  end

  def is_move?(input)
    @game.board.available_positions.any? {|position| input.to_i == position && input.include?(position.to_s) }
  end

  def is_undo_command?(input)
    input.include?("undo")
  end

  def is_redo_command?(input)
    input.include?("redo")
  end
end
