require 'game'

RSpec.describe Game do
  let (:board) {Board.new}
  let (:player_one) {HumanPlayer.new('x')}
  let (:player_two) {HumanPlayer.new('o')}
  let (:game) {Game.new(board, player_one, player_two)}

  it "knows whos turn it is" do
    game.make_move(1)
    game.make_move(2)
    expect(board.get[1]).to eq('o')
  end

  it "knows if the game is over" do
    board.mark(0, 'x')
    board.mark(1, 'x')
    board.mark(2, 'x')
    expect(game.is_over?).to eq(true)
  end

  it "decreases the position by one" do
    game.make_move(1)
    expect(board.get[0]).to eq('x')
  end

  it "doesn't allow you to go in invalid positions" do
    game.make_move(-1)
    expect(board.get.find {|cell| cell == 'x' || cell == 'o'}).to eq(nil)
  end
end
