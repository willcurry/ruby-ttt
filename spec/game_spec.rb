require 'game'

RSpec.describe Game do
  let (:board) {Board.new}
  let (:player_one) {HumanPlayer.new('x')}
  let (:player_two) {HumanPlayer.new('o')}
  let (:game) {Game.new(board, player_one, player_two)}

  it "knows whos turn it is" do
    game.make_move(0)
    game.make_move(1)
    expect(board.get[1]).to eq('o')
  end

  it "knows if the game is over" do
    board.mark(0, 'x')
    board.mark(1, 'x')
    board.mark(2, 'x')
    expect(game.is_over?).to eq(true)
  end
end
