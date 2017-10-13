require 'stock_picker'

describe 'stock_picker' do

  it 'raiese and error when non-Array is passed in' do 
    expect{stock_picker('hello')}.to raise_error(RuntimeError)
  end

  it 'raises an error if passed-in Array has fewer than two elements' do 
    expect{stock_picker([1])}.to raise_error(RuntimeError)
  end 

  it "raises an error if the Array's values are descending" do 
    expect{stock_picker([20, 15, 10])}.to raise_error(RuntimeError)
  end
end