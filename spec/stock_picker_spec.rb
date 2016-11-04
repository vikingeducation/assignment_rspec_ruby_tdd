
require 'stock_picker'

describe '#stock_picker' do

  it 'raises an error if not passed an array' do
    expect{ stock_picker("Foo") }.to raise_error(TypeError)
  end

  it 'returns the most profitable pair of days to first buy then sell stock' do
    test_data = [44, 30, 24, 32, 35, 30, 40, 38, 15]
    expect(stock_picker(test_data)).to eq([2, 6])
  end

end
