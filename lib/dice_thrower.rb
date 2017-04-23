class Game

	def initialize 
    @player = Player.new
    @computer = Computer.new
    @player_score = 0
    @computer_score = 0
	end

	def play
		instructions

    

	end

	def instructions
    
  end

end

class Player

	def initialize
	end

end

class Computer

	def initialize
	end
  
end

#g = Game.new
#g.play

#Create Players 
#Print instructions
#Loop until player quits
	#Print score
	#Get input from Player
	#Player and Computer throw dice 
	#Check whose throw has the highest sum
	#Add to number of wins of the winner
