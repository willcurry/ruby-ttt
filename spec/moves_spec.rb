require 'moves'

RSpec.describe Moves do
  it "stores correct move" do
    moves = Moves.new([1, 2, 3])
    expect(moves.get).to eq([1, 2, 3])
  end
end
