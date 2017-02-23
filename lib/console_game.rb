class ConsoleGame
  def initialize(output = $stdout)
    @output = output
  end

  def display_board(board)
    board.each_slice(3).to_a.each {|row| print(row.join(' ')) }
  end


  def display_invalid_move
    print("Invalid move!")
  end

  def display_modes(modes)
    modes.each {|mode| print("#{mode.key}) #{mode.name}")}
  end

  def game_over(board)
    display_board(board.get)
    board.is_won? ? print(board.winner + " has won the game!") : print("The game is a draw!")
  end

  private 

  def print(string)
    @output.print(string + "\n")
  end
end
