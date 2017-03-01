$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'console_game'
require 'game_creator'
require 'game_catalogue'

console = ConsoleGame.new
game_creator = GameCreator.new(console)
game_catalogue = GameCatalogue.new(console)
game = game_creator.create
game.start
game_catalogue.add(game.recording)
recording = game_catalogue.select_game
recording.play
