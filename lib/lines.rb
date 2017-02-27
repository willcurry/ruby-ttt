class Lines
  def initialize(cells, dimension)
    @cells = cells
    @dimension = dimension
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
end
