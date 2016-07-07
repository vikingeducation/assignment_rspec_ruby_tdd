require 'spec_helper'
require 'board'
require 'player'

describe '.Game' do
# game
	# initialize player and computer
	let( :game ) { Game.new }

	describe '#initialize' do

		it 'should create a player' do

			expect( @player ).to be_an_instance_of( game )

		end

	end



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

end