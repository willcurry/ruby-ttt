require 'console_game'
require 'board'
require 'game'
require 'human_vs_human'

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

  it "displays the winner correctly" do
    board = Board.new(['x', 'x', 'x', '-', '-', '-', '-', '-', '-'])
    @console_game.game_over(board)
    expect(@output.string).to include("o has won the game!")
  end

  it "displays if the game is a draw" do
    @console_game.game_over(@board)
    expect(@output.string).to include("The game is a draw!")
  end

  it "displays invalid move correctly" do
    @console_game.display_invalid_move
    expect(@output.string).to include("Invalid move!")
  end

  it "displays all the modes correctly" do
    modes = [Modes::HumanVsHuman.new]
    @console_game.display_modes(modes)
    expect(@output.string).to include("1) Human VS Human")
  end
end
