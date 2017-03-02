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
    return if input.nil?
    @game.make_move(input.to_i) if is_move?(input)
    run_undo_command if is_undo_command?(input) 
    run_redo_command if is_redo_command?(input) 
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

  private 

  def run_undo_command
    @undone_boards << @game.board
    @undo.run
  end

  def run_redo_command
    @redo.give_boards(@undone_boards)
    @redo.run
  end
end
