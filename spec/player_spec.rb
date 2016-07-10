require 'spec_helper'
require 'board'
require 'player'
require 'game'

=begin
describe '.Player' do

	let( :player ){ Player.new }

# player
	describe '#initialize' do


		it 'player should be a player' do

			expect( player ).to be_a( Player )


		end

	end
	# selects dice to throw


	describe '#get_num_dice' do

		it 'should get the number of dice from the player' do




		end

	end


		it 'should loop through request for input until valid'


	describe '#valid_input' do

		it 'should return false if bad input' do

			expect( player.valid_input?( 0 ) ).to be false

			player.valid_input?( 0 )

		end


	end






	# quits game
	it 'should quit the game if the player enters the CMD'


end

=end