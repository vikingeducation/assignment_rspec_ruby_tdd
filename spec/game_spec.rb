require 'spec_helper'
require 'board'
require 'player'
require 'game'

describe '.Game' do
# game
	# initialize player and computer
	let( :game ) { Game.new }

	describe '#initialize' do

		it 'should set current player to player' do

			expect( game.instance_variable_get( :@current_player ) ).to be_a( Player )

		end


		it 'computer should be a Computer' do

			expect( game.instance_variable_get( :@computer) ).to be_a( Computer )

		end

		it 'player should be a Player' do

			expect( game.instance_variable_get( :@player) ).to be_a( Player )

		end

		it 'board should be a Board' do

			expect( game.instance_variable_get( :@board ) ).to be_a( Board )

		end

		it '@player_score set to 0' do

			expect( game.instance_variable_get( :@player_score )).to eq( 0 )

		end

		it '@cpu_score set to 0' do

			expect( game.instance_variable_get( :@cpu_score )).to eq( 0 )

		end

	end

	describe '#change_players' do

		it 'should change players' do

			player = Player.new

      game.instance_variable_set( :@current_player, player )

			game.change_players

			expect( game.change_players ).to be_a( Computer )


		end


		describe '#check_result' do

			it 'should return no change in score if a draw' do

				game.check_result( 4, 5 )
				game.check_result( 4, 5 )
				# score is 0 2
				game.check_result( 5, 5 )

				expect( game.instance_variable_get( :@player_score ) ).to eq( 0 )

			end

			it 'should add to player score if player wins round' do

				game.check_result( 6, 5 )
				game.check_result( 6, 5 )
				# score is 0 2
				game.check_result( 6, 5 )

				expect( game.instance_variable_get( :@player_score ) ).to eq( 3 )

			end


			it 'should add to computer score if player wins round' do

				game.check_result( 3, 5 )
				game.check_result( 3, 5 )
				# score is 0 2
				game.check_result( 3, 5 )

				expect( game.instance_variable_get( :@cpu_score ) ).to eq( 3 )

			end

		end



	end


end