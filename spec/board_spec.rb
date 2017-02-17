require 'board'

RSpec.describe Board do
  it "creates a board" do
    board = Board.new
    expect(board.get.size).to eq(3)
  end
end
