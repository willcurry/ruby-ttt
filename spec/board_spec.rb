require 'board'

RSpec.describe Board do
  let (:board) {Board.new}

  it "creates a board" do
    expect(board.get.size).to eq(9)
  end

  it "makes move in correct place" do
    board.make_move(0)
    expect(board.get[0]).to eq('x')
  end

  it "rotates turns" do
    board.make_move(0)
    board.make_move(1)
    expect(board.get[1]).to eq('o')
  end

  it "knows if board is won from row" do
    board.make_move(0)
    board.make_move(4)
    board.make_move(1)
    board.make_move(5)
    board.make_move(2)
    expect(board.is_won).to eq(true)
  end

  it "knows if board is won from column" do
    board.make_move(0)
    board.make_move(1)
    board.make_move(3)
    board.make_move(5)
    board.make_move(6)
    expect(board.is_won).to eq(true)
  end

  it "knows if game is not won" do
    board.make_move(3)
    expect(board.is_won).to eq(false)
  end
end
