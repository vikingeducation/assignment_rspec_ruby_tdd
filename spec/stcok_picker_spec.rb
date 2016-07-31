require 'stock_picker.rb'

describe 'stockpicker' do

  let(:warning){ 'No pairs available!' }

  it 'returns no pairs available when input []' do
    expect(stock_picker []).to eq(warning)
  end

  it 'return no pairs available when input is nil' do
    expect(stock_picker ).to eq(warning)
  end

  it 'return no pairs available when input has no profit' do
    expect(stock_picker [30, 20]).to eq(warning)
  end

  it 'return no pairs available when input has only one data' do
    expect(stock_picker [10]).to eq(warning)
  end

  it 'raise warning when input is not an array' do
    expect{ stock_picker 'string' }.to raise_error('Input data should be an array!')
  end

  it 'raise warning when input has negative values' do
    expect{ stock_picker [10, -10, 30] }.to raise_error('Input data should be positive!')
  end

  it 'return [0, 1] when inputs is [10, 20]' do
    expect(stock_picker [10, 20]).to eq([0, 1])
  end
  it 'return [2, 6] when input is [44, 30, 24, 32, 35, 30, 40, 38, 15]' do
    expect(stock_picker [44, 30, 24, 32, 35, 30, 40, 38, 15]).to eq([2, 6])
  end


end
