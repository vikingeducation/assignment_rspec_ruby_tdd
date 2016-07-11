require 'spec_helper'
require 'board'
require 'player'
require 'game'
require 'computer'

describe ".Computer" do

	let( :computer ) { Computer.new }

	describe '#get_num_dice' do

		it 'should call roll' do

			expect( computer ).to receive( :roll )

			computer.get_num_dice

		end

	end



end