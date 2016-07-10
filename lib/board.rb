


class Board

	attr_reader :board

	def initialize( board = nil )

		@board = board

	end


	def render( p_score, cpu_score )

		puts "Player had #{p_score} and CPU had #{cpu_score}"

	end


	def display_outcome( total1, total2 )

		puts "**********************"

		puts "Your Score: #{total1}"
		puts "CPU Score : #{total2}"

		puts "**********************"

	end


end