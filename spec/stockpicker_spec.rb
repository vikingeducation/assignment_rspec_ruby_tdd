require 'stockpicker'

describe StockPicker do

  describe '#initialize' do
    let(:stocks) { StockPicker.new([44, 30, 24, 32, 35, 30, 40, 38, 15]) }
    it 'is set to whatever array it is passed' do
      expect(stocks.prices).to eq([44, 30, 24, 32, 35, 30, 40, 38, 15])
    end
  end
  describe '#check_prices' do
    let(:bad_stocks) { StockPicker.new([44, 'hello']) }
    it 'raises an error when passed an array containing non-integers' do
      expect { bad_stocks.check_prices }.to raise_error
    end
  end
  describe '#determine_best_buy_day' do
    let(:stocks) { StockPicker.new([44, 30, 24, 32, 35, 30, 40, 38]) }
    it 'returns the index of the lowest price' do
      expect(stocks.determine_best_buy_day).to eq(2)
    end
    let(:stocks) { StockPicker.new([44, 30, 24, 32, 35, 30, 40, 38, 15]) }
    it 'does not pick the last index even if it is the lowest' do
      expect(stocks.determine_best_buy_day).to eq(2)
    end
  end
  describe '#determine_best_sell_day' do
    let(:stocks) { StockPicker.new([44, 30, 24, 32, 35, 30, 40, 38, 15]) }
    it 'returns the index of the highest price past the day bought' do
      expect(stocks.determine_best_sell_day).to eq(6)
    end
  end
  describe '#best_days' do
    let(:stocks) { StockPicker.new([44, 30, 24, 32, 35, 30, 40, 38, 15]) }
    it 'returns the best pair for buying/selling the stock' do
      expect(stocks.best_days).to eq([2, 6])
    end
  end

end
