require_relative "player"
require_relative "round"

class DiceThrower

	attr_reader :human

	def initialize
		@human = Player.new
		@computer = Player.new("Computer")
		@rounds = []
		@num_wins_human = 0
		@num_wins_computer = 0
	end

	def play
		start
		main_game
	end

	def start
		print_instruction
	end

	private

	def main_game
		loop do
			dice_to_throw = @human.make_choice
			break if dice_to_throw == -1
			the_round = Round.new
			the_round.human_score = @human.play dice_to_throw
			the_round.computer_score = @computer.play dice_to_throw
			@rounds << the_round
			render
		end
		render
	end

	def print_instruction
		puts "Welcome to Dice Thrower"
		puts "Instructions:"
		puts "Enter how many dice you'd like to throw"
		puts "If your total is higher than the computer, you win!"
		puts "Enter 'q' to quit."
		puts
		render
	end

	def calculate_num_wins
		@num_wins_human = @rounds.inject(0) do |num_wins, cur_round|
			(cur_round.winner == :human) ? num_wins += 1 : num_wins
		end
		@num_wins_computer = @rounds.inject(0) do |num_wins, cur_round|
			(cur_round.winner == :computer) ? num_wins += 1 : num_wins
		end
	end

	def render
		calculate_num_wins
		puts "\n ***** SCORE *****"
		puts " You:  #{@num_wins_human} wins"
		puts " Clue: #{@num_wins_computer} wins"
		puts " *****************\n"
	end
end

#game = DiceThrower.new
#game.play