# Require the board
require('board.rb')

class TowersOfHanoi
	attr_reader :height

	def initialize(height)
		@height = height
		@board = Board.new(@height)
	end

	# Play the game
	def play(options = {})
		loop do
			@board.render
			puts options[:error] if options[:error]
			current_move = get_input
			is_valid?(current_move) ? @board.move(current_move) : play({:error => "Invalid input"})
			break if options[:test_mode] == 1 
		end
	end

	# Get input from user
	def get_input
		puts "Enter your move"
		input = gets.chomp
	end

	# Is the move valid?
	def is_valid?(move)
		move = move.split(",").map(&:to_i)
		valid = true
		valid = false if move.length != 2
		valid = false if move.any?{|item| !item.is_a?(Integer)}
		valid = false if @board.board[move[0]] == []
		valid = false if move.any?{|item| item < 1 || item > 3}
		valid
	end
end