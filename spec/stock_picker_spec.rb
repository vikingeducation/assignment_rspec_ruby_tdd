require 'stock_picker'

describe "#stock_picker" do 

  it "raises an error if stock prices are not in an array" do 
    expect do
      stock_picker("not an array")
    end.to raise_error("Error: invalid argument")
  end

  it "raises an error if stock prices are not numbers" do 
    expect do 
      stock_picker(["hello","my",:name,"is"])
    end.to raise_error("Error: invalid argument")
  end

  it "returns 0 if stock prices array is empty" do 
    expect(stock_picker([])).to eq(0)
  end

  it "returns a single value if stock prices array has one value" do
    expect(stock_picker([1])).to eq(1)
  end 

  it "correctly finds the most profitable pair of days to buy then sell (integer version)" do
    stock_prices = [44, 30, 24, 32, 35, 30, 40, 38, 15]
    expect(stock_picker(stock_prices)).to eq([2,6])
  end

  it "correctly finds the most profitable pair of days to buy then sell (float version)" do
    stock_prices = [44.2, 30.8, 24.1, 32.2, 35.3, 30, 40, 38, 15.9]
    expect(stock_picker(stock_prices)).to eq([2,6])
  end

  it "returns [0,0] if profit is not possible" do
    stock_prices = [44, 1, 1, 1]
    expect(stock_picker(stock_prices)).to eq([0,0])
  end


end