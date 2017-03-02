require 'computer_player'

RSpec.describe ComputerPlayer do
  it "goes for the win on a row 3x3" do
    board = Board.new(['-', '-', '-', 'x', 'x', '-', '-', '-', '-'])
    computer = ComputerPlayer.new('x')
    expect(computer.input(board)).to eq(5)
  end

  it "blocks the win on a row 3x3" do
    board = Board.new(['-', '-', '-', 'o', 'o', '-', '-', '-', '-'])
    computer = ComputerPlayer.new('x')
    expect(computer.input(board)).to eq(5)
  end

  it "goes for the win on a column 3x3" do
    board = Board.new(['x', '-', '-',
                       'x', '-', '-', 
                       '-', '-', '-'])
    computer = ComputerPlayer.new('x')
    expect(computer.input(board)).to eq(6)
  end

  it "blocks the win on a column 3x3" do
    board = Board.new(['o', '-', '-',
                       'o', 'x', '-',
                       '-', '-', '-'])
    computer = ComputerPlayer.new('x')
    expect(computer.input(board)).to eq(6)
  end

  it "goes for the win on a diagonal 3x3" do
    board = Board.new(['x', '-', '-',
                       '-', 'x', '-', 
                       '-', '-', '-'])
    computer = ComputerPlayer.new('x')
    expect(computer.input(board)).to eq(8)
  end

  it "blocks the win on a diagonal 3x3" do
    board = Board.new(['o', '-', '-',
                       '-', 'o', '-',
                       '-', '-', '-'])
    computer = ComputerPlayer.new('x')
    expect(computer.input(board)).to eq(8)
  end
end
