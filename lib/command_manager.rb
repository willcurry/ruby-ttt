require 'game'
require 'undo'
require 'redo'

class CommandManager
  def initialize(game)
    @game = game
    @previous_commands = []
  end

  def manage(input)
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
    undo = Undo.new(@game)
    undo.execute
    @previous_commands << undo
  end

  def run_redo_command
    redo_command = Redo.new(@game, @previous_commands)
    redo_command.execute
  end
end
