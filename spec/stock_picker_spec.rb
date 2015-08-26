require 'spec_helper'

require_relative '../lib/stock_picker.rb'

describe '#stock_picker' do
	let(:prices){[44, 30, 24, 32, 35, 30, 40, 38, 15]}
	let(:result){stock_picker(prices)}

	it 'accepts an array as a parameter' do
		expect {result}.to_not raise_error
	end

	it 'raises an error if the argument is not an array' do
		expect {stock_picker("Boom!")}.to raise_error('Argument must be an array')
	end

	it 'raises an error if the array does not hold only numbers' do
		expect {stock_picker(['1234', 1, 2, 3, 4])}.to raise_error("Not a number")
	end

	it 'returns an array as output' do
		expect(result).to be_kind_of(Array)
	end

	it 'outputs an array of exactly 2 integers' do
		expect(result[0]).to be_kind_of(Integer)
		expect(result[1]).to be_kind_of(Integer)
	end

	it 'outputs an array with only indexes from the original array' do
		expect(result[0]).to be_between(0, prices.length)
		expect(result[1]).to be_between(0, prices.length)
	end

	it 'outputs the pair of numbers with the largest difference' do
		expect(result).to eq([2, 6])
	end

	it 'outputs the most profitable 2 days from various inputs' do
		expect(stock_picker([1, 100, 0, 1000])).to eq([2, 3])
		expect(stock_picker([1, 50, 2, 60])).to eq([0, 3])
	end
end