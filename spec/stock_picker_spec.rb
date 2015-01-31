require 'stock_picker'

describe '#stock_picker' do
  it 'receives an array without error' do
    expect do
      stock_picker([1,2,3,4,5])
    end.not_to raise_error
  end
  it 'returns an array' do
    expect(stock_picker([1,2,3,4,5])).to be_an_instance_of(Array)
  end
  it 'returns an array with 2 elements' do
    expect(stock_picker([1,2,3,4,5]).length).to eq(2)
  end
  it 'returns nothing if it receives nothing or an array of 1 element' do
    expect(stock_picker([])).to eq(nil)
    expect(stock_picker([1])).to eq(nil)
  end
  it 'raises an error if it receives an invalid type' do
    expect do
      stock_picker("hello!")
    end.to raise_error
  end
  it 'returns the two most profitable indices if given an array of prices' do
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
  end

end