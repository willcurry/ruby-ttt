require 'lines'

class Board
  attr_reader :dimension
  attr_reader :cells
  attr_reader :previous
  attr_reader :undone
  attr_reader :last_move

  def initialize(cells = [], last_move = 'o', dimension = 3, previous_board = self)
    @dimension = dimension
    @cell_count = dimension * dimension
    @cells = cells.empty? ? create_board(@cell_count) : cells
    @last_move = last_move
    @lines = Lines.new(@cells, dimension)
    @previous = previous_board
  end

  def create_board(cell_count)
    cells = []
    cell_count.times {cells << '-'}
    cells
  end

  def mark(position, player)
    cells = @cells.dup
    cells[position] = player 
    Board.new(cells, player, @dimension, self)
  end

  def is_won?
    @lines.any_row_wins? || @lines.any_column_wins? || @lines.any_diagonal_wins?
  end

  def has_draw?
    @cells.find {|cell| cell == '-'}.nil?
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
end
