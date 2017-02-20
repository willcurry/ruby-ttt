require 'computer_player'

RSpec.describe ComputerPlayer do
  it "goes for the win" do
    board = Board.new(['x', 'o', '-', 'x', 'x', '-', '-', '-', '-'])
    computer = ComputerPlayer.new('x', board)
    expect(computer.next_move).to eq(5)
  end
end
