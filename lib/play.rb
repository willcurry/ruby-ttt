require_relative 'game'
require_relative 'human_player'

board = Board.new
player_one = HumanPlayer.new('x')
player_two = HumanPlayer.new('o')
game = Game.new(board, player_one, player_two)
game.start
