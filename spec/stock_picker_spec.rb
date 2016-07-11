require 'spec_helper'
require 'stock_picker'
require 'pry'


#Write a method stock_picker which takes an array of stock prices (prices on days 0, 1, ...) and outputs the most profitable pair of days on which to first buy the stock and then sell the stock, for example:

#> stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
#=> [2, 6]
#You'll need to make sure you think about potential edge cases ahead of time, then write tests which slowly build up the code to solve them. There are quite a few in there which trip people up when they solve this problem.

# method that takes the array
	# happy - receieves an array of all int/floats
	# sad - receives array without all ints
	# sad - doesn't receive an array
	# sad - all elements are 0
	# sad - only one element
	# sad - 2 elements - with no desireable outcome
# method that evaluates each number
	# track the index
	# find lowest
	# find highest
	# assign index


describe '.StockPicker' do


	let( :stocks ){ [44, 30, 24, 32, 35, 30, 40, 38, 15] }

	let( :bad_stocks ){ [ 23, 'a', 15, 29 ] }

	let( :stock_arr ){ StockPicker.new( stocks ) }

	let( :bad_picker ){ StockPicker.new( bad_stocks )}




	describe '#initialize' do


		it 'be an instance of StockPicker' do

			expect( stock_arr ).to be_a( StockPicker )

		end

		it 'should raise an argument error if no parameter passed' do

			expect{ StockPicker.new }.to raise_error( ArgumentError )

		end

	end


	describe '#validate_stocks' do



		it 'should raise error if not all Fixnums' do

			expect{ bad_picker.validate_stocks }.to raise_error("Not all numbers")

		end



		it 'should raise error if only one element or empty' do

			one_stock = StockPicker.new([3])

			expect{ one_stock.validate_stocks }.to raise_error("Not enough stocks")

		end



	end



	describe '#best_days' do

		it 'should return the best days' do

			expect( stock_arr.stock_picker ).to eq( [ 2, 6 ])

		end

		it 'should raise error if no good days' do

			bad_days = StockPicker.new( [45, 44, 43])

			expect{ bad_days.stock_picker }.to raise_error("No good days")


		end

	end


end



