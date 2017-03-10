class MakeMove
  attr_reader :board

  def initialize(game, move)
    @game = game
    @move = move
  end

  def execute
    @board = @game.board
    @game.make_move(@move)
  end
end
