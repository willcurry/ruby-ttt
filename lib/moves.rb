class Moves
  def initialize(moves = [])
    @moves = moves
  end

  def get
    @moves
  end

  def add(move)
    @moves << move
  end

  def undo
    @undone_move = @moves.pop
  end

  def redo
    @moves << @undone_move
  end
end
