require 'rspec'
require 'stock_picker'

describe StockPicker do
  let(:stocks) {StockPicker.new}
  let(:arr) { [44, 30, 24, 32, 35, 30, 40, 38, 15] }
  describe "#compare" do
    it "subtracts an earlier day from a later day" do
      expect(stocks.compare(arr,[0,1])).to eq(-14)
      expect(stocks.compare(arr,[2,6])).to eq(16)
    end
  end

  describe "#stock_picker" do
    it "returns the most profitable pair of days" do
      expect(stocks.stock_picker(arr)).to eq([2,6])
      expect(stocks.stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 1, 18])).to eq([8,9])
    end
  end
end