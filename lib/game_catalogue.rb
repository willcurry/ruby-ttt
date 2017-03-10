class GameCatalogue
  attr_reader :games

  def initialize
    @games = []
  end

  def add(game)
    @games << {time: Time.now, game: game}
  end

  def select_game(game_id)
    @games[game_id - 1][:game]
  end
end
