require 'game_creator'
require 'console_game'

RSpec.describe GameCreator do
  before (:each) do
    output = StringIO.new
    @input = StringIO.new
    console_game = ConsoleGame.new(output, @input)
    @game_creator = GameCreator.new(console_game)
  end

  it "creates a game" do
    @input.puts("1\n1")
    @input.rewind
    expect(@game_creator.create).to be_a(Game)
  end
end
