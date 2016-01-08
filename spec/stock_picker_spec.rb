require 'stock_picker'

describe '#stock_picker' do
	it 'raises an error if no array passed as parameter' do
		expect{ stock_picker }.to raise_error
	end

	it 'input array has to be all integers' do
		expect{ stock_picker([1, "A", 2, "B"]) }.to raise_error
	end
end
