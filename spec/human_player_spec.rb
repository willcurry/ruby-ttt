require 'human_player'

RSpec.describe HumanPlayer do
  before(:each) do
    reader, @writer = IO.pipe
    @human = HumanPlayer.new('x', reader)
  end

  it "knows its mark" do
    expect(@human.mark).to eq('x')
  end

  it "knows its next move" do
    @writer.puts("1")
    expect(@human.next_move("")).to eq(1)
  end
end
