require 'board'

RSpec.describe Board do
  let (:board) {Board.new}

  it "creates a board" do
    expect(board.get.size).to eq(3)
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
end
