class Player

	attr_reader :type, :current_score
	
	def initialize(type = "Human")
		raise "Bad player type specified" unless (type == "Human" || type == "Computer")
		@type = type
		@current_score = 0
	end

	def play(num_dice_to_throw)
		@current_score = roll_dice(num_dice_to_throw)
	end

	def make_choice
		prompt_user if @type == "Human"
	end

	private

	def prompt_user
		num_dice_to_throw = 0
		user_input = ''
		loop do
			puts "Enter number of dice to throw"
			user_input = gets.chomp
			break if user_input == 'q'
			num_dice_to_throw = user_input.to_i
			break if num_dice_to_throw > 0
		end
		num_dice_to_throw = -1 if user_input == 'q'
		num_dice_to_throw
	end

	def roll_dice(n = 1)
		dice_values = (1..6).to_a
		sum = 0
		n.times	do |i|
			sum += dice_values.sample
		end
		sum
	end
end