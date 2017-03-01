class Redo 
  def initialize(game)
    @game = game
    @moves = game.moves
  end

  def give_boards(boards)
    @undone_boards = boards
  end

  def run
    @moves.redo
    @game.board = @undone_boards.pop
  end
end
