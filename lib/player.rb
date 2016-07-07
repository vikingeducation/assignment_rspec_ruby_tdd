require_relative 'game'
require_relative 'computer'
require_relative 'board'

class Player

	attr_reader :name, :board

	def initialize( name = "Joe" )

		@name = name

	end


	def dice_prompt

		@board.message("Please enter the number of dice")

	end

end