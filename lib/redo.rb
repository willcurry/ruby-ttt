class Redo 
  def initialize(game, previous_undos)
    @game = game
    @moves = game.moves
    @previous_undos = previous_undos
  end

  def execute
    @moves.redo
    undone_command = @previous_undos.pop
    @game.board = undone_command.undone_board
  end
end
