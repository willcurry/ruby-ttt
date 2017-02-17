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
  end

  def is_won
    any_row_wins? || any_column_wins?
  end

  def any_column_wins?
    seperate_rows.transpose.each do |column|
      return true if !column.include?('-') && contains_same(column)
    end
    false
  end

  def any_row_wins?
    seperate_rows.each do |row|
      return true if !row.include?('-') && contains_same(row)
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
