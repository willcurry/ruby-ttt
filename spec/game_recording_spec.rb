require 'game_recording'

RSpec.describe GameRecording do
  before (:each) do
    @output = StringIO.new
    @input = StringIO.new
    @game_type = ConsoleGame.new(@output, @input)
  end

  it "plays the game correctly" do
    moves = Moves.new([0, 1, 2, 3, 4, 5, 6])
    game_recording = GameRecording.new(@game_type, 3, moves)
    game_recording.play
    expect(@output.string).to include("x has won the game!")
  end

  it "plays the game correctly with correct board dimension" do
    moves = Moves.new([0, 4, 1, 5, 2, 6, 3])
    game_recording = GameRecording.new(@game_type, 4, moves)
    game_recording.play
    expect(@output.string).to include("x has won the game!")
  end
end
