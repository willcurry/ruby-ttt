class ComputerPlayer
  def initialize(mark)
    @mark = mark
  end

  def mark
    @mark
  end

  def input(board)
    minimax(8, board, @mark, -1000, 1000)[1]
  end

  private

  def new_score(player)
    player == @mark ? -1000 : 1000
  end

  def score(board, depth)
    if board.is_won? && board.last_move == @mark
      depth
    elsif board.is_won? && board.last_move != @mark
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

  def minimax(depth, board, player, alpha, beta)
    best_score = new_score(player)
    best_move = -1
    if board.is_over? || depth == 0
      return [score(board, depth), best_move]
    end
    board.available_positions.each do |position|
      new_board = board.mark(position, player)
      scored_move = minimax(depth - 1, new_board, player == 'x' ? 'o' : 'x', alpha, beta)
      if favours_computer?(player, scored_move, best_score)
        best_score = scored_move[0]
        best_move = position
      end
      if player == @mark
        alpha = [alpha, best_score].max
      else
        beta = [beta, best_score].min
      end
      break if alpha >= beta
    end
    [best_score, best_move]
  end
end
