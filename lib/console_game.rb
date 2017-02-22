class ConsoleGame
  def initialize(output = $stdout)
    @output = output
  end

  def display_board(board)
    board.each_slice(3).to_a.each {|row| print(row.join(' ')) }
  end

  private 

  def print(string)
    @output.print(string + "\n")
  end
end
