
require 'spec_helper'
require 'player'
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

		it 'should call the render method' do

			expect( board ).to receive( :render )

			board.render

		end

	end
	# displays messages

	describe '#display' do

		it 'should call the display method' do

			expect( board ).to receive( :display )

			board.display("hello")

		end


	end


end #/.board class
