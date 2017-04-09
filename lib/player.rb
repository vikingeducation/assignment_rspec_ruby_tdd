class Player
	attr_reader :dice

	def ask_how_many_dice
		puts "How many dice would you like to play"
		@dice = gets.chomp.to_i
	end
end