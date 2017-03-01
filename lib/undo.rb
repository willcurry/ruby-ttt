class Undo
  def initialize(game)
    @game = game
    @moves = game.moves
  end

  def run
    @moves.undo
    board = @game.board
    @game.board = board.previous
  end
end
