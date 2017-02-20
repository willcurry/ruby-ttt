require 'human_player'

RSpec.describe HumanPlayer do
  it "knows its mark" do
    human = HumanPlayer.new('x')
    expect(human.mark).to eq('x')
  end
end
