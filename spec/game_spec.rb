require 'spec_helper'
require 'board'
require 'player'
require 'game'

describe '.Game' do
# game
	# initialize player and computer
	let( :game ) { Game.new }


	# assigns total
	it 'should assign the sum to the current player'
	# checks win
	it 'should choose the player if their total is higher'
	it 'should choose the cpu if their total is higher'
	# increments score
	it 'should add one to the score for player winning that round'
	# increment round
	it 'should increment the round by one'

end