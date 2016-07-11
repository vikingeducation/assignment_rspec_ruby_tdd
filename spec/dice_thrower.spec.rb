
#Build a simple game where a human player enters a number of dice and then rolls that many different 6-sided dice. The computer then rolls the same number of dice. The player with the higher total sum wins the round. Score is kept on a running basis until the game is exited.

#To do this TDD-style:

#Make sure to use at least three different classes.

#Don't explicitly test the rendering of your game, though you are welcome to test whether render is called.

#Before you begin, whiteboard/pseudocode your solution! Start high level and add detail until you're ready to code it up. Go through the Happy/Sad/Bad paths ahead of time.

#Convert your pseudo-tests into tests and TDD away!

# classes
	# player
	# board
	# game

# player
	# selects dice to throw
	it 'should call the board message to display'
	# gets errors for invalid input
	it 'should raise error for an invalid input'
	# quits game
	it 'should quit the game if the player enters the CMD'

# game
	# initialize player and computer
	it 'should create a player'
	it 'should create a computer'
	it 'should assign the current player'
	it 'should create a board'
	# rolls the dice
	it 'should return a random number on 1 die (6 sides)'
	# assigns total
	it 'should assign the sum to the current player'
	# checks win
	it 'should choose the player if their total is higher'
	it 'should choose the cpu if their total is higher'
	# increments score
	it 'should add one to the score for player winning that round'
	# increment round
	it 'should increment the round by one'

# board
	# renders board
	it 'should call the render method'
	# displays messages
	it 'should call the display method'