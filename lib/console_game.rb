class ConsoleGame
  def initialize(game, output = $stdout)
    @game = game
    @board = @game.board
    @output = output
  end

  def display_board
    @board.each_slice(3).to_a.each {|row| print(row.join(' ')) }
  end

  private 

  def print(string)
    @output.print(string + "\n")
  end
end
