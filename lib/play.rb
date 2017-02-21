require_relative 'game'
require_relative 'human_player'
require_relative 'computer_player'

board = Board.new
player_one = HumanPlayer.new('x')
player_two = ComputerPlayer.new('o')
game = Game.new(board, player_one, player_two)
game.start
