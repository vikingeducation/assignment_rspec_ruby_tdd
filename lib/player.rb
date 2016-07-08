require_relative 'game'
require_relative 'board'

class Player

	attr_reader :name, :board

	def initialize( name = "Joe" )

		@name = name

	end



	def get_num_dice

		num_dice = 0

		loop do

   		@board.message("Please enter the number of dice")

	  	num_dice = gets.strip.to_i

	 		break unless num_dice < 1

	  end

	  return num_dice

	end



end



class Computer < Player




end