require 'moves'

RSpec.describe Moves do
  it "stores correct move" do
    moves = Moves.new([1, 2, 3])
    expect(moves.get).to eq([1, 2, 3])
  end

  it "can add moves" do
    moves = Moves.new([1, 2, 3])
    moves.add(1)
    expect(moves.get).to eq([1, 2, 3, 1])
  end

  it "it can undo a move" do
    moves = Moves.new([1, 2, 3])
    moves.undo
    expect(moves.get).to eq([1, 2])
  end

  it "it can redo a move" do
    moves = Moves.new([1, 2, 3])
    moves.undo
    expect(moves.get).to eq([1, 2])
    moves.redo
    expect(moves.get).to eq([1, 2, 3])
  end
end
