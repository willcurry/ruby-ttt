require 'mode_picker'

RSpec.describe ModePicker do
  before (:each) do
    @mode_picker = ModePicker.new
  end

  it "returns a HumanVsHuman mode if the input is 1" do
    expect(@mode_picker.request_mode(1)).to be_a(Modes::HumanVsHuman)
  end

  it "returns a HumanVsComputer mode if the input is 2" do
    expect(@mode_picker.request_mode(2)).to be_a(Modes::HumanVsComputer)
  end

  it "returns a ComputerVsComputer mode if the input is 3" do
    expect(@mode_picker.request_mode(3)).to be_a(Modes::ComputerVsComputer)
  end

  it "returns a ComputerVsHuman mode if the input is 4" do
    expect(@mode_picker.request_mode(4)).to be_a(Modes::ComputerVsHuman)
  end
end
