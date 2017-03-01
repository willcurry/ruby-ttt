class HumanPlayer
  def initialize(mark, input = $stdin)
    @mark = mark
    @input = input
  end

  def mark
    @mark
  end

  def input(board)
    @input.gets
  end
end
