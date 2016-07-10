require 'spec_helper'
require 'board'
require 'player'
require 'game'

describe '.Player' do

	let( :player ){ Player.new }

	describe '#get_num_dice' do

		it 'should return roll when called with correct num' do

			allow( player ).to receive( :ask_for_dice ).and_return( 5 )

			allow( player ).to receive( :valid_input? ).and_return( true )

			expect( player ).to receive( :roll )

			player.get_num_dice

	  end

	end #/.getnumdice

	describe '#ask_for_dice' do

		it 'should return a number' do

			allow( player ).to receive( :gets ).and_return( "5" )

			expect( player.ask_for_dice ).to eq( 5 )

			player.ask_for_dice

		end


		it 'should call exit?' do

			allow( player ).to receive( :gets ).and_return( "5" )

			expect( player ).to receive( :exit? )

			player.ask_for_dice

		end



	end #/.Ask for dice



	describe '#valid_input?' do

		it 'should return true if passed 1 or higher' do

			expect( player.valid_input?( 6 ) ).to be true

		end

		it 'should return false if passed 0' do

			expect( player.valid_input?( 0 )).to be false

		end


	end #/. valid input


	describe '#roll' do

		it 'should return a num between 1 and 6 with 1 die' do

			$num_dice = 1

			expect( player.roll ).to be > 1

		end

	end


end #/.Player

