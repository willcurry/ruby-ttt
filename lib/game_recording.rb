require 'actor_player'
require 'game'
require 'board'

class GameRecording
  def initialize(game_type = ConsoleGame.new, board_dimension = 3, moves)
    @moves = moves
    @game_type = game_type
    @board_dimension = board_dimension
  end

  def play
    game = create_game
    game.start
  end

  private

  def create_game
    players = create_players
    game = Game.new(Board.new([], players[1].mark, @board_dimension), players[0], players[1], @game_type)
  end

  def create_players 
    [ActorPlayer.new('x', StringIO.new, moves_for('x')), ActorPlayer.new('o', StringIO.new, moves_for('o'))]
  end

  def moves_for(player)
    moves = []
    i = 0
    while i < @moves.size
      moves << @moves[i] if i.odd? && player == 'o'
      moves << @moves[i] if i.even? && player == 'x'
      i += 1
    end
    moves
  end
end
