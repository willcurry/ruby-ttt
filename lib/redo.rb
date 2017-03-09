class Redo 
  def initialize(game, previous_commands)
    @game = game
    @moves = game.moves
    @previous_commands = previous_commands
  end

  def execute
    @moves.redo
    last_command = @previous_commands.pop
    @game.board = last_command.board
  end
end
