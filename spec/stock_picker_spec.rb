# RSPEC stock_picker_spec.rb

require 'stock_picker'

describe 'StockPicker' do

  before do
#    allow($stdout).to receive(:puts)
  end

  it 'is a StockPicker' do
    expect(subject).to be_a(StockPicker)
  end

  let(:stockpicker){StockPicker.new([25, 21, 27, 23])}
  describe '#initialize' do
    it 'accepts a daily stock prices array on creation' do
      expect{stockpicker}.not_to raise_error
    end

    it 'creates a stock prices array on creation' do
      expect(stockpicker.prices).to eq([25, 21, 27, 23])
    end

    let(:stockpicker_no_price_array){StockPicker.new}
    it 'creates an empty stock prices array when not supplied on creation' do
      expect(stockpicker_no_price_array.prices).to eq([])
    end
  end

  describe '#validate_prices' do

    let(:stockpicker_no_price_array){StockPicker.new}
    it 'raises an error when price array is empty' do
      expect{stockpicker_no_price_array.validate_prices}.to raise_error("No prices supplied!")
    end
   
    let(:stockpicker_only_one_price){StockPicker.new([25])}
    it 'raises an error when price array contains only one price' do
      expect{stockpicker_only_one_price.validate_prices}.to raise_error("Price for only one day supplied -- need at least for two days!")
    end

    let(:stockpicker){StockPicker.new([35, 25, 30, 43, 55, 35])}
    it 'returns highest profit' do
      stockpicker.stock_picker
      expect(stockpicker.highest_profit).to eq(30)
    end

    it 'returns buy day' do
      stockpicker.stock_picker
      expect(stockpicker.buy_day).to eq(2)
    end

    it 'returns sell day' do
      stockpicker.stock_picker
      expect(stockpicker.sell_day).to eq(5)
    end    

    let(:stockpicker_f){StockPicker.new([25, 35, 30, 43, 55, 35])}
    it 'returns buy day on first possible day without raising error' do # edge case "SAD"
      stockpicker_f.stock_picker
      expect(stockpicker_f.buy_day).to eq(1)
    end

    let(:stockpicker_l){StockPicker.new([35, 25, 30, 43, 35, 55])}
    it 'returns sell day on last possible day without raising error' do # edge case "SAD"
      stockpicker_l.stock_picker
      expect(stockpicker_l.sell_day).to eq(6)
    end      

    let(:stockpicker_no_profit){StockPicker.new([35, 25, 15])}
    it 'returns zero profit when none found' do # edge case "SAD"
      stockpicker_no_profit.stock_picker
      expect(stockpicker_no_profit.highest_profit).to eq(0)
    end      


  end


end