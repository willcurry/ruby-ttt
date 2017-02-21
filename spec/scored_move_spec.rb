RSpec.describe ScoredMove do
  it "knows when its better then another score" do
    scored_move = ScoredMove.new(5, 5, 'x')
    scored_move_new = ScoredMove.new(4, 4, 'x')
    expect(scored_move.is_better_than?(scored_move_new, 'x')).to eq(true)
  end

  it "knows when its not better then another score" do
    scored_move = ScoredMove.new(5, 5, 'x')
    scored_move_new = ScoredMove.new(6, 6, 'x')
    expect(scored_move.is_better_than?(scored_move_new, 'x')).to eq(false)
  end

  it "knows when the opponent has a better score" do
    scored_move = ScoredMove.new(5, 5, 'x')
    scored_move_new = ScoredMove.new(6, 6, 'o')
    expect(scored_move.is_better_than?(scored_move_new, 'o')).to eq(true)
  end
end
