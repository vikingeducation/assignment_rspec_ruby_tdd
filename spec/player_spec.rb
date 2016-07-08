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


	describe '#get_num_dice' do

		it 'should get the number of dice from the player' do

			allow( player ).to receive(:gets).and_return( "5" )
			allow( @board ).to receive( :message ).and_return( true )

			expect( player.get_num_dice).to eq( 5 )

		end


			let(:player_double){"Player"}


		# gets errors for invalid input
		it 'should loop through request for input until valid' do


			allow( player_double ).to receive( :gets ).and_return( "0", "k", "-1")
			allow( @board ).to receive( :message ).and_return( true )


			allow( player ).to receive(:gets) do

				@counter ||= 0
				@counter += 1
				"1"
			end


			player.get_num_dice
			expect( @counter ).to eq( 3 )


		end


	end


	# quits game
	it 'should quit the game if the player enters the CMD'


end