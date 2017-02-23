require 'game_recording'

RSpec.describe GameRecording do
  before (:each) do
    @game_recording = GameRecording.new
  end

  it "records the correct position" do
    @game_recording.move(1, 'x')
    expect(@game_recording.moves[0][:position]).to eq(1)
  end

  it "records the correct player" do
    @game_recording.move(1, 'x')
    expect(@game_recording.moves[0][:player]).to eq('x')
  end
end
