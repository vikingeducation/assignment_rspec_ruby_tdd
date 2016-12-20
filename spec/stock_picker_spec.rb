require "stock_picker"

describe "#stock_picker" do
	
	it 'calculate a good buy and sell day1' do
		expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
	end

	it 'calculate a good buy and sell day2' do
		expect(stock_picker([44, 20, 100, 3, 35, 30, 12, 38, 10])).to eq([1,2])
	end

	it 'calculate a good buy and sell day3' do
		expect(stock_picker([44, 20, 100, 20, 101, 20, 99, 38, 10])).to eq([1,4])
	end
end