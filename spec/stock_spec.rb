require_relative '../lib/stock.rb'

describe '#stock' do

  it 'should raise an error if an argument is not given' do
    expect{stock}.to raise_error(ArgumentError)
  end

  # TODO:  Better way to do this?  arg.to be_Array?
  it 'should only accept an array as an argument' do
    expect{stock(1)}.to raise_error("Oops, need an array")
    expect{stock('hi')}.to raise_error("Oops, need an array")
  end

  it 'should raise an error if less than 2 days given' do
    expect{stock([1])}.to raise_error("Oops, need more days")
  end

  it 'should return [0,1] if only given 2 days' do
    expect(stock([25, 42])).to eq([0, 1])
  end

  it 'should return a buy day that is before the sell day' do
    expect(stock([25, 16, 4])).to eq([0, 1])
  end

  it 'should pick the best buy and sell day combination' do
    expect(stock([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2, 6])
  end

end