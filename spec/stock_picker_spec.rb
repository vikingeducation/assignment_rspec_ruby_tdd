require 'stock_picker'

=begin
happy
  -takes an array of dates and returns most profitable pair of days
  > stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
  #=> [2, 6]
sad
  -only decreasing prices array -no profit
bad
  -receiving a string
  -receiving only one entry

=end

describe "#stockpicker" do

  it 'output is an array of number' do
    expect(stock_picker([1,5])).to be_a(Array)
  end

  it 'returns most profitable pair of days with more than two days' do
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
  end

  it 'returns error if array only contains one entry' do
    expect{stock_picker([1])}.to raise_error(ArgumentError)
  end

  it 'returns error if input is not an integer' do
    expect{stock_picker("string")}.to raise_error(ArgumentError)
  end

  it 'returns a response to user if there are no profitable days' do
    expect(stock_picker([50,7,0])).to eq("Sorry!")
  end


end