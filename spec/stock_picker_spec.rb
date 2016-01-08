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

	it 'selects day to buy the stock' do
		expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15]).first).to eq([24,60].first)

	end
end
