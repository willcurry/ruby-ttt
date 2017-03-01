class Lines
  def initialize(cells, dimension)
    @cells = cells
    @dimension = dimension
  end

  def any_column_wins?
    has_win?(seperate_rows.transpose)
  end

  def any_row_wins?
    has_win?(seperate_rows)
  end

  def any_diagonal_wins?
    has_win?([left_diagonal_cells, right_diagonal_cells])
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

  private

  def has_win?(line)
    line.any? {|line| !line.include?('-') && contains_same(line)}
  end

  def seperate_rows
    rows = @cells.each_slice(@dimension).to_a
  end

  def contains_same(row)
    row.uniq.size <= 1
  end
end
