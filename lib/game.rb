require_relative 'player'
require_relative 'computer'
require_relative 'board'


class Game

	attr_reader :current_player

	def initialize

		@player = Player.new( "Joe" )
		@computer = Computer.new( "Computer" )
		@board = Board.new

		@current_player = @player


	end


end