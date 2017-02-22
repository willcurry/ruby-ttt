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

  def display_invalid_move
    print("Invalid move!")
  end

  def display_modes(modes)
    modes.all? {|mode| print("#{mode.key}) #{mode.name}")}
  end

  private 

  def print(string)
    @output.print(string + "\n")
  end
end
