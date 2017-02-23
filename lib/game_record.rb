class GameRecord
  def initialize
    @moves = []
  end
  
  def move(position, player)
    @moves << {:position => position, :player => player}
  end

  def moves
    @moves
  end
end
