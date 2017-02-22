require 'mode_picker'

RSpec.describe ModePicker do
  before (:each) do
    @input = StringIO.new
    @mode_picker = ModePicker.new(@input)
  end

  it "returns a HumanVsHuman mode if the input is 1" do
    @input.puts("1")
    @input.rewind
    expect(@mode_picker.request_mode).to be_a(HumanVsHuman)
  end

  it "returns a HumanVsComputer mode if the input is 2" do
    @input.puts("2")
    @input.rewind
    expect(@mode_picker.request_mode).to be_a(HumanVsComputer)
  end
end
