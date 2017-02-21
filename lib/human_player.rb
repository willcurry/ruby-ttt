class HumanPlayer
  def initialize(mark, input = $stdin)
    @mark = mark
    @input = input
  end

  def mark
    @mark
  end

  def next_move(board)
    @input.gets.to_i
  end
end
