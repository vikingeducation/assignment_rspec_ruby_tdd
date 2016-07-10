require 'pry'

class Player

	QUIT_CMDS = [ "q", "quit", "exit" ]

	attr_reader :name, :board, :num_dice


	def get_num_dice

		loop do

	  	$num_dice = ask_for_dice

	  	if valid_input?( $num_dice )
	  		return roll
	  	end

	  end

	end


	def exit?( cmd )

		exit if QUIT_CMDS.include?( cmd )

	end

	def roll

		total = 0

		$num_dice.times do

			total += rand( 1..6 )

		end

		return total

	end




	def ask_for_dice

		puts %q(Please enter the number of dice to play with:)

		num = gets.strip
		exit?( num )

		return num.to_i


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



