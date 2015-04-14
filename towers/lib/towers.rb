# Require the board
require_relative('board.rb')

class TowersOfHanoi
	attr_reader :height

	def initialize(height)
		@height = height
		@board = Board.new(@height)
	end

	# Play the game
	def play(options = {})
		@board.render
		puts options[:error] if options[:error]
		current_move = get_input.split(",").map(&:to_i)
		is_valid?(current_move) ? @board.move(current_move) : play({:error => "Invalid input"})
		@board.is_victory? ? victory_ending : play
	end

	# Get input from user
	def get_input
		puts "Enter your move"
		input = gets.chomp
	end

	# Is the move valid?
	def is_valid?(move)
		return false if move.length != 2
		return false if move.any?{|item| !item.is_a?(Fixnum)}
		return false if @board.get_board[move[0]-1] == []
		return false if move.any?{|item| item < 1 || item > 3}
		if !@board.get_board[move[1]-1].first.nil? && !@board.get_board[move[0]-1].first.nil?
			if @board.get_board[move[0]-1].first > @board.get_board[move[1]-1].first
				return false
			end
		end
		true
	end

	def victory_ending
		@board.render
		puts "YOU WIN!"
	end
end