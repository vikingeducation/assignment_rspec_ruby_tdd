require 'stock_picker'

describe '#stock_picker' do
  it 'raises an error if not given parameters' do
    expect{ stock_picker }.to raise_error(ArgumentError)
  end

  it 'raises an error if not given an array' do
    expect{ stock_picker(1) }.to raise_error(ArgumentError)
  end

  it 'raises an error if array has less than two elements' do
    expect{ stock_picker([1]) }.to raise_error('Please enter two or more days.')
  end

  it 'returns a two element array when given valid input' do
    expect(stock_picker([1,2])).to eq([0,1])
  end

  it 'raises an error if its not possible to profit' do
    expect{ stock_picker([4,3]) }.to raise_error "No profit possible"
  end

  it 'returns most profitable days to buy and sell from a set of stock prices' do
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
  end

end
