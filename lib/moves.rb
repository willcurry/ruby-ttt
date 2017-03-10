class Moves
  def initialize(moves = [])
    @moves = moves
    @undone_moves = []
  end

  def get
    @moves
  end

  def add(move)
    @moves << move
  end

  def undo
    @undone_moves << @moves.pop
  end

  def redo
    @moves << @undone_moves
  end
end
