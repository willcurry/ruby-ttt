class ConsoleGame
  def initialize(output = $stdout)
    @output = output
  end

  def display_board(board)
    board.each_slice(3).to_a.each {|row| print(row.join(' ')) }
  end

  def display_winner(player)
    print(player.mark + " has won the game!")
  end

  private 

  def print(string)
    @output.print(string + "\n")
  end
end
