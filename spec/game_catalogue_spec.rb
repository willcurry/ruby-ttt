require 'game_catalogue'
require 'game_recording'
require 'moves'

RSpec.describe GameCatalogue do
  before (:each) do
    @output = StringIO.new
    @input = StringIO.new
    @console = ConsoleGame.new(@output, @input)
    @game_catalogue = GameCatalogue.new(@console)
    @moves = Moves.new([1, 2, 3, 4, 5])
    @game_recording = GameRecording.new(@console, 3, @moves)
  end

  it "can have games added" do
    @game_catalogue.add(@game_recording)
    expect(@game_catalogue.games.first[:game]).to eq(@game_recording)
  end

  it "can select a game" do
    @input.puts("2")
    @input.rewind
    expected = GameRecording.new(@console, 3, @moves)
    @game_catalogue.add(@game_recording)
    @game_catalogue.add(expected)
    expect(@game_catalogue.select_game).to eq(expected)
  end
end
