require 'stock_picker'

describe StockPicker do

  it 'takes an array' do
    test = StockPicker.new([1, 2, 3])
    expect(test.pick_stock).to eq([1, 2, 3])
  end

end