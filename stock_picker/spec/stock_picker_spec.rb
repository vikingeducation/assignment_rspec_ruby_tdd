require 'stock_picker'

describe "#stock_picker" do
	it 'returns an array' do
		expect(stock_picker([1,50,4])).to be_an(Array)
	end

	it 'accepts an array' do
		expect{stock_picker([1,2])}.to_not raise_error
	end

	it 'throws error if given a string' do
		expect{stock_picker([1,2,"break"])}.to raise_error(ArgumentError, "Invalid Input")
	end

	it 'throws error if given a float' do
		expect{stock_picker([1,2,3.4])}.to raise_error(ArgumentError, "Invalid Input")
	end

	it 'throws error if given nothing' do
		# Throws standard 0 for 1 array
		expect{stock_picker()}.to raise_error
	end

	it 'throws error if given negative price' do
		expect{stock_picker([20,19,-6])}.to raise_error(ArgumentError, "Negative price")
	end

	it 'returns [2,6] when given [44, 30, 24, 32, 35, 30, 40, 38, 15]' do
		expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
	end
end