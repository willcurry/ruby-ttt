require 'actor_player'

RSpec.describe ActorPlayer do
  before (:each) do
    @input = StringIO.new
  end

  it "replays moves given to it" do
    moves = ["2", "3"]
    actor_player = ActorPlayer.new('x', @input, moves)
    expect(actor_player.input("").to_i).to eq(2)
    expect(actor_player.input("").to_i).to eq(3)
  end
end
