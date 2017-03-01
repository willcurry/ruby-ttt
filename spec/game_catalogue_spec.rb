require 'game_catalogue'
require 'game_recording'
require 'moves'

RSpec.describe GameCatalogue do
  before (:each) do
    @game_catalogue = GameCatalogue.new
    moves = Moves.new([1, 2, 3, 4, 5])
    @game_recording = GameRecording.new(moves)
  end

  it "can have games added" do
    @game_catalogue.add(@game_recording)
    expect(@game_catalogue.games.first[:game]).to eq(@game_recording)
  end
end
