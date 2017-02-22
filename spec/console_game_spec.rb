require 'console_game'
require 'board'
require 'game'

RSpec.describe ConsoleGame do
  before (:each) do
    @board = Board.new(['x', 'x', '-', '-', '-', '-', '-', '-', '-'])
    @output = StringIO.new
    @console_game = ConsoleGame.new(@output)
  end

  it "displays board correctly" do
    @console_game.display_board(@board.get)
    expect(@output.string).to include("x x -\n- - -\n- - -")
  end
end
