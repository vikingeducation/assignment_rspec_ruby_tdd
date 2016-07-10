require_relative './player.rb'
require_relative './board.rb'
require_relative './dice.rb'
require_relative './computer.rb'


class Game


	attr_reader :current_player, :player

	def initialize

		@computer = Computer.new( "Computer" )
		@board = Board.new
		@player = Player.new( "Joe" )
		@turn = 0

		@current_player = @player


	end



	def play

			total1 =	@current_player.get_num_dice

			change_players

			total2 = @current_player.get_num_dice

			increment_turn

			@board.render( total1, total2, @turn )




	end


	def change_players

		@current_player == @player ? @current_player = @computer : @current_player = @player

	end

	def increment_turn

		 @turn += 1

	end


end


dice = Game.new
dice.play