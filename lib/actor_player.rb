class ActorPlayer
  def initialize(mark, input = $stdin, moves_to_make)
    @mark = mark
    @input = input
    prepare_moves(moves_to_make)
  end

  def mark
    @mark
  end

  def next_move(board)
    @input.gets.to_i
  end

  private
  
  def prepare_moves(moves_to_make)
    moves = ""
    moves_to_make.each do |move|
      moves = moves + (move + "\n")
    end
    @input.puts(moves)
    @input.rewind
  end
end
