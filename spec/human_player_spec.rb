require 'human_player'

RSpec.describe HumanPlayer do
  before(:each) do
    @input = StringIO.new
    @human = HumanPlayer.new('x', @input)
  end

  it "knows its mark" do
    expect(@human.mark).to eq('x')
  end


  it "decreases its next move" do
    @input.puts("1")
    @input.rewind
    expect(@human.next_move("")).to eq(0)
  end
end
