require 'human_player'

RSpec.describe HumanPlayer do
  before(:each) do
    @input = StringIO.new
    @human = HumanPlayer.new('x', @input)
  end

  it "knows its mark" do
    expect(@human.mark).to eq('x')
  end
end
