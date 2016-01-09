require 'stock_picker'

describe "#stock_picker" do

  it "trivial 2 day case works" do
    expect(stock_picker([1, 100])).to eq([0, 1])
  end

  it "returns correct value on random stock array" do
    stocks = [44, 30, 24, 32, 35, 30, 40, 38, 15]
    expect(stock_picker(stocks)).to eq([2, 6])
  end

  it "returns nil if the price always falls" do
    stocks = [50, 40, 30, 20, 10]
    expect(stock_picker(stocks)).to eq(nil)
  end

  it "returns nil if price is always constant" do
    stocks = [1, 1, 1, 1, 1]
    expect(stock_picker(stocks)).to eq(nil)
  end

  it "throws ArgumentError if not enough days given" do
    expect{stock_picker([])}.to raise_error(ArgumentError)
  end

  it "throws ArgumentError if input stock values are not numbers" do
    expect{stock_picker(["A"])}.to raise_error(ArgumentError)
  end

  it "throws ArgumentError if input is not an array" do
    expect{stock_picker("A")}.to raise_error(ArgumentError)
  end
end