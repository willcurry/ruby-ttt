require 'console_game'
require 'game_creator'

console = ConsoleGame.new
game_creator = GameCreator.new($stdin, console)
console.display_modes
game = game_creator.create
game.start
