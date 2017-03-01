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

  def ask_for_mode
    ModeRegistry.all_modes.each {|mode| print("#{mode.key}) #{mode.name}")}
    input.to_i
  end

  def game_over(board)
    display_board(board)
    board.is_won? ? print(board.last_move + " has won the game!") : print("The game is a draw!")
  end

  def ask_for_board_size
    print("What board size would you like?")
    input.to_i
  end

  def ask_for_game_to_replay(games)
    print("What game would you like to rewatch?")
    i = 1
    games.each {|game| print("#{i}) #{game[:time]}"); i += 1}
    input.to_i
  end

  private 

  def input
    @input.gets
  end

  def print(string)
    @output.print(string + "\n")
  end
end
