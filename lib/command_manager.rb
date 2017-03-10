require 'game'
require 'undo'
require 'redo'
require 'make_move'

class CommandManager
  def initialize(game)
    @game = game
    @previous_undos = []
    @move_commands = []
  end

  def manage(input)
    run_move_command(input.to_i) if is_move?(input)
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
    undo = Undo.new(@game, @move_commands)
    undo.execute
    @previous_undos << undo
  end

  def run_move_command(move)
    make_move = MakeMove.new(@game, move)
    make_move.execute
    @move_commands << make_move
  end

  def run_redo_command
    redo_command = Redo.new(@game, @previous_undos)
    redo_command.execute
  end
end
