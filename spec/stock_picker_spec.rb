require 'stock_picker'

describe '#stock_picker' do

  it 'raises an error if input is not an array' do
    expect{stock_picker('s')}.to raise_error("input is not an array")
  end

  it 'raises an error if input does not have at least 3 elements' do
    expect{stock_picker([1, 2])}.to raise_error("input is too small")
  end

  it 'raises an error if input array does not fully comprise of integers' do
    expect{stock_picker(['a', 2, 3])}.to raise_error("input must contain only integers")
  end

  context 'returns the two days with greatest profit' do

    it 'can return greatest days when prices are in order' do
      expect(stock_picker([1, 2, 3, 4, 5, 6, 7])).to eq([0, 6])
    end

    it 'can return greatest days when prices are out of order' do
      expect(stock_picker([3, 2, 1, 4, 5, 6, 7])).to eq([2, 6])
    end

  end

end