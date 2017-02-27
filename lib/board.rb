class Board
  attr_reader :dimension
  attr_reader :cells

  def initialize(cells = [], last_move = 'o', dimension = 3)
    cells.empty? ? setup_new_game(dimension) : continue_game(cells)
    @last_move = last_move
  end

  def continue_game(cells)
    @cell_count = cells.size
    square_root = Math.sqrt(@cell_count)
    @dimension = square_root.round
    @cells = cells
  end

  def setup_new_game(dimension)
    @cell_count = dimension * dimension
    @dimension = dimension
    @cells = create_board(@cell_count) 
  end

  def create_board(cell_count)
    cells = []
    cell_count.times {cells << '-'}
    cells
  end

  def mark(position, player)
    cells = @cells.dup
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
    empty_cells = @cells.find {|cell| cell == '-'}
    empty_cells.nil?
  end

  def is_over?
    is_won? || has_draw?
  end

  def valid_position?(position)
    position < @cell_count && position >= 0 && @cells[position] == '-'
  end

  def available_positions
    i = 0
    positions = []
    while i < @cell_count do
      positions << i if @cells[i] == '-'
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
    while i < @dimension do
      cells << @cells[i * @dimension + i]
      i += 1
    end
    cells
  end

  def right_diagonal_cells
    cells = []
    i = @dimension
    while i > 0 do
      cells << @cells[i * @dimension - i]
      i -= 1
    end
    cells
  end
  
  def seperate_rows
    rows = @cells.each_slice(@dimension).to_a
  end

  def contains_same(row)
    row.uniq.size <= 1
  end
end
