require_relative "../stock_picker.rb"
describe "stock picker for highest profits" do
  it "pickes day 0 to buy and last day to sell if stocks increasing" do
    stock_arr = [1, 5, 6, 7, 10, 20]
    expect(stock_picker(stock_arr)).to eq([0,stock_arr.size-1])
  end

  it "picks day 0 to buy and day 3 to sell if peak is day 3" do
    stock_arr = [1, 5, 6, 20, 10, 17]
    expect(stock_picker(stock_arr)).to eq([0,3])
  end

  it "picks day 1 to buy and day 3 to sell if peak is day 3 for -ve values" do
    stock_arr = [1, -5, 6, 20, 10, 17]
    expect(stock_picker(stock_arr)).to eq([1,3])
  end

  it "empty array, returns 0,0" do
    stock_arr = []
    expect(stock_picker(stock_arr)).to eq([0,0])
  end
end
