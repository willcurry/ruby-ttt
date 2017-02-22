require 'console_game'
require 'board'
require 'game'

RSpec.describe ConsoleGame do
  before (:each) do
    @board = Board.new(['x', 'x', '-', '-', '-', '-', '-', '-', '-'])
    @game = Game.new(@board, HumanPlayer.new('x'), HumanPlayer.new('o'))
    @output = StringIO.new
    @console_game = ConsoleGame.new(@game, @output)
  end

  it "displays board correctly" do
    @console_game.display_board
    expect(@output.string).to include("x x -\n- - -\n- - -")
  end
end
