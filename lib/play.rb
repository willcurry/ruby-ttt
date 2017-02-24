$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'console_game'
require 'game_creator'

console = ConsoleGame.new
game_creator = GameCreator.new($stdin, console)
game = game_creator.create
game.start
puts "playing recording...."
game.recording.play
