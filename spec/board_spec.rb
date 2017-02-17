require 'board'

RSpec.describe Board do
  let (:board) {Board.new}

  it "creates a board" do
    expect(board.get.size).to eq(9)
  end

  it "makes move in correct place" do
    board.mark(0, 'x')
    expect(board.get[0]).to eq('x')
  end

  it "knows if board is won from row" do
    board.mark(0, 'x')
    board.mark(1, 'x')
    board.mark(2, 'x')
    expect(board.is_won).to eq(true)
  end

  it "knows if board is won from column" do
    board.mark(0, 'x')
    board.mark(3, 'x')
    board.mark(6, 'x')   
    expect(board.is_won).to eq(true)
  end

  it "knows if game is not won" do
    expect(board.is_won).to eq(false)
  end

  it "cannot make move at non empty position" do
    board.mark(1, 'x')
    board.mark(1, 'o')
    expect(board.get[1]).to eq('x')
  end
end
