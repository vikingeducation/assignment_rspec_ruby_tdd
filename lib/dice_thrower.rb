# Build a simple game where a human player enters a number of dice and then rolls that many different 6-sided dice. The computer then rolls the same number of dice. The player with the higher total sum wins the round. Score is kept on a running basis until the game is exited.
require_relative 'game'
require_relative 'dice'
require_relative 'player'
require_relative 'computer'
require_relative 'human'

# Play
Game.new.play
