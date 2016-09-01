require_relative '../lib/stock_picker.rb'

describe '#stock_picker' do

  it 'returns \'1, 2\' when input is [10, 20]' do
    expect(stock_picker(10, 20)).to eq('1, 2')
  end

  it 'returns \'3, 7\' when input is [44,30,24,32,35,30,40,38,15]' do
    expect(stock_picker(44,30,24,32,35,30,40,38,15)).to eq('3, 7')
  end
end