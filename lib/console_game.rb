class ConsoleGame
  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  def display_board(board)
    board.cells.each_slice(board.dimension).to_a.each {|row| print(row.join(' ')) }
  end

  def display_invalid_move
    print("Invalid move!")
  end

  def display_modes(modes)
    modes.each {|mode| print("#{mode.key}) #{mode.name}")}
  end

  def ask_for_mode
    @input.gets.to_i
  end

  def game_over(board)
    display_board(board)
    board.is_won? ? print(board.winner + " has won the game!") : print("The game is a draw!")
  end

  def ask_for_board_size
    print("What board size would you like?")
    @input.gets.to_i
  end

  private 

  def print(string)
    @output.print(string + "\n")
  end
end
