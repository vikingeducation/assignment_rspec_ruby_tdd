
require 'spec_helper'
require 'player'
require 'board'
require 'game'

describe '.Board' do

	let( :board ){ Board.new }

	describe '#intialize' do

		it 'board should be a board' do

				expect( board ).to be_a( Board )

		end

	end


	# board
	# renders board
	describe '#render' do

		it 'should call the render totals method' do

			expect( board ).to receive( :render_totals )

			board.render_totals( 5, 10 )

		end

	end
	# displays messages

	describe '#display_outcome' do

		it 'should call the display outcome method' do

			expect( board ).to receive( :display_outcome )

			board.display_outcome( 3, 3 )

		end


	end


end #/.board class
