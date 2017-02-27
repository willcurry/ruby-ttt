require 'actor_player'
require 'game'
require 'board'

class GameRecording
  def initialize(game_type = ConsoleGame.new, board_dimension = 3)
    @moves = []
    @game_type = game_type
    @board_dimension = board_dimension
  end
  
  def move(position, player)
    @moves << {:position => position, :player => player}
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
    @moves.each do |move|
      moves << move[:position].to_s if move[:player] == player
    end
    moves
  end
end
