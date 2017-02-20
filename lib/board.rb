class Board
  def initialize
    @board = create_board
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
    self
  end

  def is_won?
    any_row_wins? || any_column_wins?
  end

  private

  def any_column_wins?
    has_win?(seperate_rows.transpose)
  end

  def any_row_wins?
    has_win?(seperate_rows)
  end

  def has_win?(formation)
    formation.each do |formation|
      return true if !formation.include?('-') && contains_same(formation)
    end
    false
  end
  
  def seperate_rows
    rows = @board.each_slice(3).to_a
  end

  def contains_same(row)
    row.uniq.size <= 1
  end
end
