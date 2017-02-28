require 'game'
require 'input_manager'
require 'board'

RSpec.describe InputManager do
  before (:each) do
    @input = StringIO.new
    game = Game.new(Board.new, HumanPlayer.new('x', @input), HumanPlayer.new('o', @input))
    @input_manager = InputManager.new(game)
  end

  it "should be able to tell if the given input is a move" do
    expect(@input_manager.is_move?("1")).to eq(true)
  end

  it "should be able to tell if the given input is a command" do
    expect(@input_manager.is_command?("undo")).to eq(true)
  end
end
