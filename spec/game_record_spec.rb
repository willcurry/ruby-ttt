require 'game_record'

RSpec.describe GameRecord do
  before (:each) do
    @game_record = GameRecord.new
  end

  it "records the correct position" do
    @game_record.move(1, 'x')
    expect(@game_record.moves[0][:position]).to eq(1)
  end
end
