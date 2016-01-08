require 'stock_picker'

describe '#stock_picker' do
	it 'raises an error if no array passed as parameter' do
		expect{ stock_picker }.to raise_error
	end
end