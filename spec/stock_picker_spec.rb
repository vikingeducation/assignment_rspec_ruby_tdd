require "stock_picker"

describe '#stock_picker' do

  it "takes an array of stock_prices" do 
    prices = [1, 2, 3, 4, 5]
    expect{stock_picker(prices)}.not_to raise_error
  end

  it "raises error if array of prices not passed in" do
    expect{stock_picker}.to raise_error(ArgumentError)
  end

  it "raises error if prices are not formatted as an array" do
    expect{stock_picker(1, 2, 3)}.to raise_error(ArgumentError)
  end

  it "raises error if price data is only for one date" do
    expect{stock_picker([1])}.to raise_error("You have not provided enough price data!")
  end

  it "returns array of the 2 days you should buy and sell stocks for max profit" do
    prices = [2, 23, 24, 32, 14, 1000, 41, 6]
    expect(stock_picker(prices)).to eq([0,5])
  end

  it "raises error if profitability not a possibility" do
    prices = [5, 4, 3, 2, 1]
    expect{stock_picker(prices)}.to raise_error("There is no chance of profitability.")
  end
end