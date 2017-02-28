class Moves
  def initialize(moves)
    @moves = moves
  end

  def get
    @moves 
  end

  def add(move)
    @moves << move
  end

  def undo
    @moves.pop
  end
end
