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

	it 'selects best days to buy and sell' do
		expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
	end

end
