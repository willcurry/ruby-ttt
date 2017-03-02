require 'undo'
require 'game'
require 'human_player'
require 'console_game'

RSpec.describe Undo do
  before (:each) do
    @game = Game.new(Board.new, HumanPlayer.new('x'), HumanPlayer.new('o'), ConsoleGame.new)
    @undo = Undo.new(@game)
  end
  
  it "can undo a round" do
    @game.make_move(1)
    old = @game.board.cells
    @undo.run
    expect(@game.board.cells).not_to eq(old)
  end
end
