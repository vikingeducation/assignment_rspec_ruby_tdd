class Round

	attr_accessor :human_score, :computer_score

	def initialize
		@human_score = 0
		@computer_score = 0
	end

	def winner
		(@human_score > @computer_score) ? :human : :computer
	end
end