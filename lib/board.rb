


class Board

	attr_reader :board

	def initialize( board = nil )

		@board = board

	end


	def render( total1, total2, round )

		puts "#{total1}  #{total2}  #{round}"

	end


	def display( message )

		puts ""

		puts message

		puts ""

	end


end