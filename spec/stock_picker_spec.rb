require 'stock_picker'

describe '#stock_picker' do
	it 'raises an error if no array passed as parameter' do
		expect{ stock_picker }.to raise_error
	end

	it 'input array has to be all integers' do
		expect{ stock_picker([1, "A", 2, "B"]) }.to raise_error
	end

	it 'will return an array' do
		expect(stock_picker([1,2]).class).to eq([].class)
	end

	it 'try two day array with no profit dates' do
		expect(stock_picker([2,1])).to eq([])
	end

	it 'try two day array with profit dates' do
		expect(stock_picker([1,2])).to eq([0,1])
	end

	it 'all prices are the same' do
		expect(stock_picker([1,1,1])).to eq([])
	end

	it 'selects best days to buy and sell' do
		expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
	end

	it 'returns one answer set from multiple possible answers' do
		expect(stock_picker([2, 2, 4])).to eq([0,2])
	end
end
