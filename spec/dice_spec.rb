require 'spec_helper'
require 'player'
require 'game'
require 'board'
require 'dice'
require 'computer'


describe '.Dice' do

	let( :dice ){ Dice.new( 3 ) }

	describe '#initialize' do

		it 'dice should be dice' do

			expect( dice ).to be_a( Dice )

		end

		it '@num_dice should be whatever passed' do

			expect( dice.instance_variable_get( :@num_dice ) ).to eq( 3 )

		end

	end

	describe '#roll' do

		it 'should return a total for the roll' do

			expect( dice.roll ).to be >= 1

		end

	end



end