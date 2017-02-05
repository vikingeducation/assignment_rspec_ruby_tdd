# rspec/stock_picker_spec.rb
require 'stock_picker'

describe 'stock_picker' do
  it 'raises an error if stock prices is not an array' do
    expect{stock_picker("1,2,3")}.to raise_error("Not provided an array")
  end

  it 'does not throw an error if an array is provided' do
     expect{stock_picker([2,4])}.to_not raise_error
  end

  it 'accepts an array' do
     expect{stock_picker([2,3,4,5])}.is_a?(Array)
  end

  it 'raises an error if the wrong number of arguments are supplied' do
     expect{stock_picker([2,3,4,5], [1,2])}.to raise_error(ArgumentError)
  end

  it 'returns an array with 2 numbers' do
    expect(stock_picker([1,2]).size).to eq(2)
  end

  it 'The 2nd day should be more than the 1st stock day' do
    stock_days = [2,3,4,10]
    result = stock_picker(stock_days)
    expect(result[0]).to be < result[1]
  end

  it 'The 2nd day should be less than or equal to the total number of days)' do
    stock_days = [2,3,4,10]
    result = stock_picker(stock_days)

    expect(result[1]).to be <= stock_days.size - 1
  end


  it 'returns the minumum day' do
     days = stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
      expect(days[0]).to eq(2)
  end

  it 'returns the maximum day' do
    days = stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
      expect(days[1]).to eq(6)
  end

  it 'returns the min and max' do
    days = stock_picker([20, 78])
    expect(days).to eq([0,1])
  end
end