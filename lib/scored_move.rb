class ScoredMove
  attr_reader :score
  attr_reader :move

  def initialize(score, move, mark)
    @score = score
    @move = move
    @mark = mark
  end

  def is_better_than?(scored_move, player)
    player == @mark && @score > scored_move.score || player != @mark && @score < scored_move.score
  end
end
