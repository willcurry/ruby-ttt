class ComputerPlayer
  def initialize(mark)
    @mark = mark
    @current_best_move = -1
  end

  def mark
    @mark
  end

  def next_move(board)
    minimax(8, board, @mark)[1] + 1
  end

  private

  def new_score(player)
    player == @mark ? -1000 : 1000
  end

  def score(board, depth)
    if board.is_won? && board.winner == @mark
      depth
    elsif board.is_won? && board.winner != @mark
      -depth
    else
      0
    end
  end

  def favours_computer?(player, scored_move, best_score)
    if player == @mark
      scored_move[0] > best_score
    else
      scored_move[0] < best_score
    end
  end

  def minimax(depth, board, player)
    best_score = new_score(player)
    best_move = @current_best_move
    if board.is_over? || depth == 0
      return [score(board, depth), best_move]
    end
    board.available_positions.each do |position|
      new_board = board.mark(position, player)
      scored_move = minimax(depth - 1, new_board, player == 'x' ? 'o' : 'x')
      if favours_computer?(player, scored_move, best_score)
        best_score = scored_move[0]
        best_move = position
      end
    end
    [best_score, best_move]
  end
end
