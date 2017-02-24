require 'game_recording'

RSpec.describe GameRecording do
  before (:each) do
    @output = StringIO.new
    @game_type = ConsoleGame.new(@output)
    @game_recording = GameRecording.new(@game_type)
  end

  it "plays the game correctly" do
    @game_recording.move(0, 'x')
    @game_recording.move(1, 'o')
    @game_recording.move(2, 'x')
    @game_recording.move(3, 'o')
    @game_recording.move(4, 'x')
    @game_recording.move(5, 'o')
    @game_recording.move(6, 'x')
    @game_recording.play
    expect(@output.string).to include("x has won the game!")
  end

  it "plays the game correctly with correct board dimension" do
    game_recording = GameRecording.new(@game_type, 4)
    game_recording.move(0, 'x')
    game_recording.move(4, 'o')
    game_recording.move(1, 'x')
    game_recording.move(5, 'o')
    game_recording.move(2, 'x')
    game_recording.move(6, 'o')
    game_recording.move(3, 'x')
    game_recording.play
    expect(@output.string).to include("x has won the game!")
  end
end
