class Undo
  attr_reader :undone_board

  def initialize(game, move_commands)
    @game = game
    @moves = game.moves
    @move_commands = move_commands
  end

  def execute
    @moves.undo
    @undone_board = @game.board
    undone_command = @move_commands.pop
    @game.board = undone_command.board
  end
end
