require "warmups"

describe "stock_picker" do
  it "returns the buy and sell days of most profit" do
    result = stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
    expect(result).to eq({buy: 2, sell: 6, profit: 16})
  end
end
