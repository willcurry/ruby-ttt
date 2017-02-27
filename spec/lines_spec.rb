require 'lines'

RSpec.describe Lines do
  before (:each) do
    @lines = Lines.new(['x', 'x', 'o', '-', '-', '-', '-', '-', '-'], 3)
  end

  it "correctly returns the cells for a left diagonal" do
    expect(@lines.left_diagonal_cells).to eq(['x', '-', '-'])
  end

  it "correctly returns the cells for a right diagonal" do
    expect(@lines.right_diagonal_cells).to eq(['-', '-', 'o'])
  end

  it "knows if row has won" do
    lines = Lines.new(['x', 'x', 'x', '-', '-', '-', '-', '-', '-'], 3)
    expect(lines.any_row_wins?).to eq(true)
  end

  it "knows if column has won" do
    lines = Lines.new(['x', '-', '-', 'x', '-', '-', 'x', '-', '-'], 3)
    expect(lines.any_column_wins?).to eq(true)
  end

  it "knows if diagonal has won" do
    lines = Lines.new(['x', '-', '-', '-', 'x', '-', '-', '-', 'x'], 3)
    expect(lines.any_diagonal_wins?).to eq(true)
  end
end
