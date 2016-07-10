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
		@player_score = 0
		@cpu_score = 0

		@current_player = @player


	end



	def play

		loop do

			total1 =	@current_player.get_num_dice

			change_players

			total2 = @current_player.get_num_dice

			change_players

			check_result( total1, total2 )

			@board.render( total1, total2 )
			@board.display_outcome( @player_score, @cpu_score )

		end


	end


	def change_players

		@current_player == @player ? @current_player = @computer : @current_player = @player

	end



	def check_result( p1, cpu )

		if p1 == cpu
			return
		elsif p1 > cpu
			@player_score += 1
		else
			@cpu_score += 1
		end

	end


end


dice = Game.new
dice.play