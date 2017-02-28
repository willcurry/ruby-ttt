require 'board'

RSpec.describe Board do
  let (:board) {Board.new}

  it "creates a board" do
    expect(board.cells.size).to eq(9)
  end

  it "creates a board with the given size" do
    board = Board.new([], 'o', 4)
    expect(board.cells.size).to eq(16)
  end

  it "makes move in correct place" do
    new_board = board.mark(0, 'x')
    expect(new_board.cells[0]).to eq('x')
  end

  it "knows if board is won from row 4x4" do
    board = Board.new(['x', 'x', 'x', 'x', 
                       '-', '-', '-', '-',
                       '-', '-', '-', '-',
                       '-', '-', '-', '-'], 'o', 4)
    expect(board.is_won?).to eq(true)
  end

  it "knows if board is won from column 4x4" do
    board = Board.new(['x', '-', '-', '-', 
                       'x', '-', '-', '-',
                       'x', '-', '-', '-',
                       'x', '-', '-', '-'], 'o', 4)
    expect(board.is_won?).to eq(true)
  end

  it "knows if board is won from diagonal" do
    board = Board.new(['x', '-', '-', '-', 
                       '-', 'x', '-', '-',
                       '-', '-', 'x', '-',
                       '-', '-', '-', 'x'], 'o', 4)
    expect(board.is_won?).to eq(true)
  end

  it "knows if board is won from row" do
    board = Board.new(['x', 'x', 'x', '-', '-', '-', '-', '-', '-'])
    expect(board.is_won?).to eq(true)
  end

  it "knows if board is won from column" do
    board = Board.new(['x', '-', '-', 'x', '-', '-', 'x', '-', '-'])
    expect(board.is_won?).to eq(true)
  end

  it "knows if board is won from left diagonal" do
    board = Board.new(['x', '-', '-', '-', 'x', '-', '-', '-', 'x'])
    expect(board.is_won?).to eq(true)
  end

  it "knows if board is won from right diagonal" do
    board = Board.new(['-', '-', 'x', '-', 'x', '-', 'x', '-', '-'])
    expect(board.is_won?).to eq(true)
  end

  it "knows if game is not won" do
    expect(board.is_won?).to eq(false)
  end

  it "knows if there is a draw" do
    board = Board.new(['x', 'o', 'o', 'o', 'x', 'x', 'x', 'o', 'o'])
    expect(board.is_won?).to eq(false)
    expect(board.has_draw?).to eq(true)
  end

  it "knows valid positions" do
    expect(board.valid_position?(0)).to eq(true)
    expect(board.valid_position?(-1)).to eq(false)
    expect(board.valid_position?(9)).to eq(false)
  end

  it "knows available positions" do
    new_board = board.mark(7, 'x')
    expect(new_board.available_positions).to eq([0, 1, 2, 3, 4, 5, 6, 8])
    new_board = new_board.mark(8, 'x')
    expect(new_board.available_positions).to eq([0, 1, 2, 3, 4, 5, 6])
  end

  it "knows the previous board" do
    new_board = board.mark(3, 'o')
    new_board = board.mark(7, 'x')
    expect(new_board.previous.last_move).to eq('o')
  end
end
