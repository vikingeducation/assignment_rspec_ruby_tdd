require 'pry'

class Player

	attr_reader :name, :board, :num_dice

	def initialize( name = "Joe" )

		@name = name
		@num_dice = 0

	end



	def get_num_dice

		loop do

	  	@num_dice = ask_for_dice

	  	if valid_input?( @num_dice )
	  		roll
	  		break
	  	end

	  end

	end


	def roll

		total = 0

		@num_dice.times do

			total += rand( 1..6 )

		end

		return total

	end




	def ask_for_dice

		puts %q(Please enter the number of dice to play with:)

		return gets.strip.to_i


	end



	def valid_input?( input )

		if input >= 1
			true
		else
			puts "Invalid number, please try again."
			false
		end


	end



end



