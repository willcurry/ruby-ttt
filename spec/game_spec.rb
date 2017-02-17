require 'game'

RSpec.describe Game do
  let (:game) {Game.new}

  it "knows whos turn it is" do
    board = Board.new
    game = Game.new(board)
    game.make_move(0)
    game.make_move(1)
    expect(board.get[1]).to eq('o')
  end
end
