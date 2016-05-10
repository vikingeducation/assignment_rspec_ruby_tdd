require_relative '../lib/stock_picker'

describe "Stock Picker" do

  it "takes an array of integers as an argument" do
    expect{ stock_picker([1,3]) }.not_to raise_error
  end

  it "raises error if there are fewer than 2 integers in argument array" do
    expect{ stock_picker([1]) }.to raise_error(ArgumentError)
  end

  it "raises errors if argument contains non Integers" do
    expect{ stock_picker([1,2,"foo"]) }.to raise_error(ArgumentError)
  end

  it "returns optimal days to buy and sell stocks by index number" do
    expect(stock_picker([99, 3, 4, 45, 33, 43, 23, 80, 55, 66])).to eq([1,7])
  end
end
