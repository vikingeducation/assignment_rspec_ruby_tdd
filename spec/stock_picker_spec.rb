require 'stock_picker'
	
describe '#stock_picker(stock_prices)' do
  it 'should raise an ArgumentError if argument is not an array of at least two non-negative numbers' do
    expect{stock_picker(2)}.to raise_error(ArgumentError)
    expect{stock_picker([1])}.to raise_error(ArgumentError)
    expect{stock_picker([-2, 5])}.to raise_error(ArgumentError)
    expect{stock_picker([6, 8])}.not_to raise_error
  end

  it 'should return the days with the highest profit' do
    expect(stock_picker([1, 2, 4, 8])).to eq([0, 3])
  end

  it 'should return the days with the smallest loss when there is no profit' do
    expect(stock_picker([8, 4, 2, 1])).to eq([2, 3])
  end

  it 'should make sure the buying day comes before the selling day' do
  	expect(stock_picker([44, 20, 40])).to eq([1, 2])
  end

end

