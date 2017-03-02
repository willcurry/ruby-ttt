require 'mode_registry'
require 'console_game'

RSpec.describe ModeRegistry do
  before (:each) do
    @mode_registry = ModeRegistry.new(ConsoleGame.new)
  end

  it "returns a HumanVsHuman mode if the input is 1" do
    expect(@mode_registry.find(1)).to be_a(Modes::HumanVsHuman)
  end

  it "returns a HumanVsComputer mode if the input is 2" do
    expect(@mode_registry.find(2)).to be_a(Modes::HumanVsComputer)
  end

  it "returns a ComputerVsComputer mode if the input is 3" do
    expect(@mode_registry.find(3)).to be_a(Modes::ComputerVsComputer)
  end

  it "returns a ComputerVsHuman mode if the input is 4" do
    expect(@mode_registry.find(4)).to be_a(Modes::ComputerVsHuman)
  end
end
