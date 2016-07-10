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



	end #/. valid input


end #/.Player

