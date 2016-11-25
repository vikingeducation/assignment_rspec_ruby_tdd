require 'stock_picker'

describe '#stock_picker' do
  let(:prices) { [44, 30, 24, 32, 35, 30, 40, 38, 15] }
  let(:result) { stock_picker(prices) }

  it 'takes an array as a parameter' do
    expect {result}.to_not raise_error
  end

  it 'raises an error if the argument is not an array' do
    expect {stock_picker('Not an array')}.to raise_error('Argument must be an array')
  end

  it 'returns an array' do
    expect(result).to be_kind_of(Array)
  end

  it 'outputs an array of 2 integers' do
    expect(result[0]).to be_kind_of(Integer)
    expect(result[1]).to be_kind_of(Integer)
  end

  it 'outputs the pair of numbers with the largest difference' do
    expect(result).to eq([2, 6])
  end
end
