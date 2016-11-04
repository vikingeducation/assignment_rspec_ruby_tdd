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
    
  end


end
