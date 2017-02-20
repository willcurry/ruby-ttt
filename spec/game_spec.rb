require 'game'

RSpec.describe Game do
  let (:board) {Board.new}

  before(:each) do
    reader, @writer = IO.pipe
    @player_one = HumanPlayer.new('x', reader)
    @player_two = HumanPlayer.new('o', reader)
    @game = Game.new(board, @player_one, @player_two)
  end

  it "knows whos turn it is" do
    @writer.puts(1)
    @game.make_move
    @writer.puts(2)
    @game.make_move
    expect(@game.board[1]).to eq('o')
  end

  it "knows if the game is over" do
    board.mark(0, 'x')
    board.mark(1, 'x')
    board.mark(2, 'x')
    expect(@game.is_over?).to eq(true)
  end

  it "decreases the position by one" do
    @writer.puts(1)
    @game.make_move
    expect(board.get[0]).to eq('x')
  end
end
