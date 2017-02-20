class Board
  def initialize(cells = [])
    if cells.empty?
      @board = create_board
    else
      @board = cells
    end
    @turn = 'x'
  end

  def create_board
    ['-', '-', '-', '-', '-', '-', '-', '-', '-']
  end

  def get
    @board
  end

  def mark(position, player)
    @board[position] = player if @board[position] == '-'
    Board.new(@board)
  end

  def is_won?
    any_row_wins? || any_column_wins? || any_diagonal_wins?
  end

  def has_draw?
    empty_cells = @board.find {|cell| cell == '-'}
    empty_cells.nil?
  end

  def valid_position?(position)
    position < 9 && position >= 0 && @board[position] == '-'
  end

  private

  def any_column_wins?
    has_win?(seperate_rows.transpose)
  end

  def any_row_wins?
    has_win?(seperate_rows)
  end

  def any_diagonal_wins?
    cells = [left_diagonal_cells, right_diagonal_cells]
    has_win?(cells)
  end

  def has_win?(formation)
    win = formation.find {|formation| !formation.include?('-') && contains_same(formation)}
    !win.nil?
  end

  def left_diagonal_cells
    cells = []
    i = 0
    while i < 3 do
      cells << @board[i * 3 + i]
      i += 1
    end
    cells
  end

  def right_diagonal_cells
    cells = []
    i = 3
    while i > 0 do
      cells << @board[i * 3 - i]
      i -= 1
    end
    cells
  end
  
  def seperate_rows
    rows = @board.each_slice(3).to_a
  end

  def contains_same(row)
    row.uniq.size <= 1
  end

end
