require 'spec_helper'
require 'board'
require 'player'
require 'game'

describe '.Game' do
# game
	# initialize player and computer
	let( :game ) { Game.new }

	describe '#change_players' do

		it 'should change players' do

			instance_variable_set( :@current_player ).with :@player

			expect( instance_variable_get( :@current_player )).to be_a( Computer )

			game.change_players


		end


		describe '#check_result' do

			it 'should return no change in score if a draw' do

				game.check_result( 4, 5 )
				game.check_result( 4, 5 )
				# score is 0 2
				game.check_result( 5, 5 )

				expect( game.instance_variable_get( :@player_score ) ).to eq( 0 )

			end

		end


	end

	# assigns total
	it 'should assign the sum to the current player'
	# checks win
	it 'should choose the player if their total is higher'
	it 'should choose the cpu if their total is higher'
	# increments score
	it 'should add one to the score for player winning that round'
	# increment round

end