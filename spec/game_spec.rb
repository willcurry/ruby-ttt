require 'game'

RSpec.describe Game do
  let (:board) {Board.new}

  before(:each) do
    @input = StringIO.new
    @player_one = HumanPlayer.new('x', @input)
    @player_two = HumanPlayer.new('o', @input)
    @game = Game.new(board, @player_one, @player_two)
  end

  it "knows whos turn it is" do
    @input.puts("1\n1")
    @input.rewind
    @game.make_move
    @game.make_move
    expect(@game.board[0]).to eq('x')
  end

  it "knows if the game is over" do
    board = Board.new(['x', 'x', 'x', '-', '-', '-', '-', '-', '-'])
    player_one = HumanPlayer.new('x')
    player_two = HumanPlayer.new('o')
    game = Game.new(board, player_one, player_two)
    expect(game.is_over?).to eq(true)
  end

  it "decreases the position by one" do
    @input.puts("1")
    @input.rewind
    @game.make_move
    expect(@game.board[0]).to eq('x')
  end
end
