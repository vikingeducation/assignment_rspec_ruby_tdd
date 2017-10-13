require 'stock_picker'

describe 'stock_picker' do

  it 'raiese and error when non-Array is passed in' do 
    expect{stock_picker('hello')}.to raise_error(NoMethodError)
  end

  it 'raises an error if passed-in Array has fewer than two elements' do 
    expect{stock_picker([1])}.to raise_error(RuntimeError)
  end 

  it "raises an error if the Array's values are descending" do 
    expect{stock_picker([20, 15, 10])}.to raise_error(RuntimeError)
  end

  it 'returns Array of indeces of passed-in Array indicating the best days to buy and sell stock' do 
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eql([2, 6])
  end

  it 'returns an array consisting of 0 and the index of the max value of the passed-in Array 
      if the first value is the smallest' do
    expect(stock_picker([1, 30, 24, 32, 35, 30, 40, 38, 15])).to eql([0, 6])
  end
end