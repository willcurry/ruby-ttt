class Undo
  attr_reader :board

  def initialize(game)
    @game = game
    @moves = game.moves
    @board = game.board
  end

  def execute
    @moves.undo
    @game.board = @board.previous
  end
end
