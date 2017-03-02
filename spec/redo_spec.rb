require 'redo'
require 'undo'
require 'game'
require 'human_player'
require 'console_game'

RSpec.describe Redo do
  before (:each) do
    @game = Game.new(Board.new, HumanPlayer.new('x'), HumanPlayer.new('o'), ConsoleGame.new)
    @undo = Undo.new(@game)
    @redo = Redo.new(@game)
  end
  
  it "can redo a round" do
    @game.make_move(1)
    old = @game.board.cells
    @undo.run
    @redo.give_boards([old])
    expect(@game.board).not_to eq(old)
    @redo.run
    expect(@game.board).to eq(old)
  end
end
