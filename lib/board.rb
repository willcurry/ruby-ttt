class Board
  def initialize(cells = [], last_move = 'o', size = 3)
    @size = size
    @cell_count = size * size
    @board = cells.empty? ? create_board(@cell_count) : cells
    @last_move = last_move
  end

  def create_board(cell_count)
    cells = []
    cell_count.times {cells << '-'}
    cells
  end

  def get
    @board
  end

  def mark(position, player)
    cells = @board.dup
    cells[position] = player 
    Board.new(cells, player)
  end

  def winner
    @last_move
  end

  def is_won?
    any_row_wins? || any_column_wins? || any_diagonal_wins?
  end

  def has_draw?
    empty_cells = @board.find {|cell| cell == '-'}
    empty_cells.nil?
  end

  def is_over?
    is_won? || has_draw?
  end

  def valid_position?(position)
    position < @cell_count && position >= 0 && @board[position] == '-'
  end

  def available_positions
    i = 0
    positions = []
    while i < @cell_count do
      positions << i if @board[i] == '-'
      i += 1
    end
    positions
  end

  private

  def any_column_wins?
    has_win?(seperate_rows.transpose)
  end

  def any_row_wins?
    has_win?(seperate_rows)
  end

  def any_diagonal_wins?
    has_win?([left_diagonal_cells, right_diagonal_cells])
  end

  def has_win?(formation)
    win = formation.find {|formation| !formation.include?('-') && contains_same(formation)}
    !win.nil?
  end

  def left_diagonal_cells
    cells = []
    i = 0
    while i < @size do
      cells << @board[i * @size + i]
      i += 1
    end
    cells
  end

  def right_diagonal_cells
    cells = []
    i = @size
    while i > 0 do
      cells << @board[i * @size - i]
      i -= 1
    end
    cells
  end
  
  def seperate_rows
    rows = @board.each_slice(@size).to_a
  end

  def contains_same(row)
    row.uniq.size <= 1
  end
end
