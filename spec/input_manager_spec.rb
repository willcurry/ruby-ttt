require 'game'
require 'input_manager'
require 'board'
require 'console_game'

RSpec.describe InputManager do
  before (:each) do
    @input = StringIO.new
    game = Game.new(Board.new, HumanPlayer.new('x', @input), HumanPlayer.new('o', @input), ConsoleGame.new)
    @input_manager = InputManager.new(game)
  end

  it "should be able to tell if the given input is a move" do
    expect(@input_manager.is_move?("1")).to eq(true)
  end

  it "should be able to tell if the given input is an undo command" do
    expect(@input_manager.is_undo_command?("undo")).to eq(true)
  end

  it "should be able to tell if the given input is an redo command" do
    expect(@input_manager.is_redo_command?("redo")).to eq(true)
  end
end
