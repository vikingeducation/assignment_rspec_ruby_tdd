require_relative 'player'
require_relative 'board'


#METHODS
#	Roll
#	Check_Dice_Total
#	Assign_Winner
#	Increment_score
#	Increment_round



class Game

# init should create the player, computer and board

	attr_reader :current_player, :player

	def initialize

		@player = Player.new( "Joe" )
		@computer = Computer.new( "Computer" )
		@board = Board.new

		@current_player = @player


	end






end