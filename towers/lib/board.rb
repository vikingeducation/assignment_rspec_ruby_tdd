class Board
	attr_reader :board

	def initialize(height)
		@board = [[],[],[]]
		@height = height
		1.upto(height) { |i| @board[0].push(i) }
	end

	def render
		clear
		# Create output buffer (string)
		output_buffer = ""

		# Outer loop (makes the row for each column)
		(@height).downto(1) do |row|
			# Inner loop (goes through each column- always 3)
			0.upto(2) do |column|
				temp_buffer = "" # This will load each small chunk
				@board[column][-row].times{temp_buffer << "O"} unless @board[column][-row].nil?
				temp_buffer << "_" until temp_buffer.length == @height+1
				column == 0 || column == 1 ? output_buffer << temp_buffer + " " : output_buffer << temp_buffer + "\n"
			end
		end
		print output_buffer
	end

	def clear
		system "clear"
	end

	def move(move)
		@board[move[1]-1].unshift(@board[move[0]-1].shift)
	end

	def is_victory?
		victory_board = [[],[],[]]
		1.upto(@height) { |i| victory_board[2].push(i) }
		return true if @board == victory_board
		false
	end
end