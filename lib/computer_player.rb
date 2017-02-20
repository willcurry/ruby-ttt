class ComputerPlayer
  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def mark
    @mark
  end

  def next_move
    minimax
  end

  private

  def minimax
    @board.available_positions.each do |move|
      board = @board.mark(move, @mark)
      if @board.is_won?
          return move
      end
    end
  end
end
