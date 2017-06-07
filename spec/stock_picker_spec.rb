require_relative '../lib/stock_picker'

describe "stock_picker" do

  let(:prices) {[44, 30, 24, 32, 35, 30, 40, 38, 15]}
  let(:more_prices) {[80, 95, 20, 85, 34, 43, 15, 75, 90]}
  let(:best_prices) {stock_picker(prices)}
  let(:second_best) {stock_picker(more_prices)}

  it "takes an array as an argument" do
    expect(prices).to be_a(Array)
  end

  context "given an array of stock prices" do

    it "returns an array" do
      expect(best_prices).to be_a(Array)
    end

    it "returns an array with two elements" do
      expect(best_prices.size).to eq(2)
    end

    it "first element is lowest price (best day to buy)" do
      expect(second_best[0]).to eq(6)
    end

    it "second element is highest price (best day to sell)" do
      expect(second_best[1]).to eq(8)
    end

    it "returns most profitable pair of days to buy and sell" do
      expect(more_prices[second_best[1]] - more_prices[second_best[0]]).to eq(75)
    end

  end

end
