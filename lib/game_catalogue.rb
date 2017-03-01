class GameCatalogue
  attr_reader :games

  def initialize
    @games = []
  end

  def add(game)
    @games << {time: Time.now, game: game}
  end
end
