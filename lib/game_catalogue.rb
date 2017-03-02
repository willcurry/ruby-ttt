require 'console_game'

class GameCatalogue
  attr_reader :games

  def initialize(game_type)
    @games = []
    @game_type = game_type
  end

  def add(game)
    @games << {time: Time.now, game: game}
  end

  def select_game
    game_index = @game_type.ask_for_game_to_replay(@games)
    @games[game_index - 1][:game]
  end
end
