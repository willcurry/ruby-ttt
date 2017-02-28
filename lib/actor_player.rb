class ActorPlayer
  def initialize(mark, input = $stdin, moves_to_make)
    @mark = mark
    @input = input
    prepare_moves(moves_to_make)
  end

  def mark
    @mark
  end

  def input(board)
     @input.gets
  end

  private
  
  def prepare_moves(moves_to_make)
    moves = moves_to_make.join("\n")
    @input.puts(moves)
    @input.rewind
  end
end
