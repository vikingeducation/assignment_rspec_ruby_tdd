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

  it 'raise warning when input is not an array' do
    expect{ stock_picker 'string' }.to raise_error('Input data should be an array!')
  end


end
