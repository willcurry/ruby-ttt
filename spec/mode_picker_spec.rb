require 'mode_picker'

RSpec.describe ModePicker do
  before (:each) do
    @mode_picker = ModePicker.new
  end

  it "returns a HumanVsHuman mode if the input is 1" do
    expect(@mode_picker.request_mode(1)).to be_a(HumanVsHuman)
  end

  it "returns a HumanVsComputer mode if the input is 2" do
    expect(@mode_picker.request_mode(2)).to be_a(HumanVsComputer)
  end

  it "returns a ComputerVsComputer mode if the input is 3" do
    expect(@mode_picker.request_mode(3)).to be_a(ComputerVsComputer)
  end
end
