require 'game_creator'

RSpec.describe GameCreator do
  before (:each) do
    @input = StringIO.new
    @game_creator = GameCreator.new(@input)
  end

  it "creates a game" do
    @input.puts("1")
    @input.rewind
    expect(@game_creator.create).to be_a(Game)
  end
end
