require 'spec_helper'
require 'board'
require 'player'
require 'game'


describe '.Player' do

	let( :player ){ Player.new }

# player
	describe '#initialize' do


		it 'player should be a player' do

			expect( player ).to be_a( Player )


		end

	end
	# selects dice to throw

	describe '#prompt_throw' do

		it 'should call the board message to display' do

			expect( player ).to receive( :dice_prompt )

			player.dice_prompt

		end

	end


	# gets errors for invalid input
	it 'should raise error for an invalid input'
	# quits game
	it 'should quit the game if the player enters the CMD'


end