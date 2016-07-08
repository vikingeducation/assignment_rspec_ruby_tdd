require_relative 'game'
require_relative 'player'


class Board

	attr_reader :board

	def initialize( board = nil )

		@board = board

	end


	def render


	end


	def display( message )

		puts ""

		puts message

		puts ""

	end


end