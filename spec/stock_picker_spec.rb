require 'stock_picker'

describe StockPicker do

  describe '#new' do
    it 'accepts an array to initialize' do
      stock_picker = StockPicker.new([1,2,3])
    end

    it 'assigns the array to daily_prices' do
      stock_picker = StockPicker.new([1,2,3,4])
      expect(stock_picker.daily_prices).to eq [1,2,3,4]
    end

    it 'will raise an error if the array does not contain only integers' do
      expect do
        string_picker = StockPicker.new(["a","b","c"])
      end.to raise_error
    end
  end

  describe '#best_dates' do

    describe 'can pick from two daily prices' do
      it 'returns [0,1] if input is two days with increasing prices' do
        stock_picker = StockPicker.new([4,5])
        expect(stock_picker.best_dates).to eq [0,1]
      end
    end

    describe 'can pick from three daily prices' do
      it 'first and last' do
        stock_picker = StockPicker.new([1,2,3])
        expect(stock_picker.best_dates).to eq [0,2]
      end
      it 'first and second' do
        stock_picker = StockPicker.new([1,2,0])
        expect(stock_picker.best_dates).to eq [0,1]
      end
      it 'second and third' do
        stock_picker = StockPicker.new([1,0,2])
        expect(stock_picker.best_dates).to eq [1,2]
      end
    end

    describe 'can pick from a list of more than three daily prices' do
      it 'picks adjacent dates' do
        stock_picker = StockPicker.new([5,5,5,4,6,5,5])
        expect(stock_picker.best_dates).to eq [3,4]
      end
      it 'picks separated dates' do
        stock_picker = StockPicker.new([44, 30, 24, 32, 35, 30, 40, 38, 15])
        expect(stock_picker.best_dates).to eq [2,6]
      end
    end

    describe 'raises errors when prices only decline' do
      it 'for two days' do
        stock_picker = StockPicker.new([5,4])
        expect do
          stock_picker.best_dates
        end.to raise_error
      end
      it 'for three days' do
        stock_picker = StockPicker.new([3,2,1])
        expect do
          stock_picker.best_dates
        end.to raise_error
      end
      it 'for more than three days' do
        stock_picker = StockPicker.new([100,99,98,97,96,95,94])
        expect do
          stock_picker.best_dates
        end.to raise_error
      end
    end
  end
end