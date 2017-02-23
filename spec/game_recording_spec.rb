require 'game_recording'

RSpec.describe GameRecording do
  before (:each) do
    @output = StringIO.new
    game_type = ConsoleGame.new(@output)
    @game_recording = GameRecording.new(game_type)
  end

  it "records the correct position" do
    @game_recording.move(1, 'x')
    expect(@game_recording.moves[0][:position]).to eq(1)
  end

  it "records the correct player" do
    @game_recording.move(1, 'x')
    expect(@game_recording.moves[0][:player]).to eq('x')
  end

  it "plays the game correctly" do
    @game_recording.move(3, 'x')
    @game_recording.move(4, 'o')
    @game_recording.move(2, 'x')
    @game_recording.move(5, 'o')
    @game_recording.move(1, 'x')
    @game_recording.play
    expect(@output.string).to include("x has won the game!")
  end
end
