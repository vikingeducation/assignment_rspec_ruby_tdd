

describe '#stock_picker' do
  let (:array) {[44, 30, 24, 32, 35, 30, 40, 38, 15]}

  it 'correctly returns buy and sell days' do
      expects(stock_picker(array).to eq([2,6])
  end

  it 'returns an array of length 2' do
      expects(stock_picker(array).length).to eq(2)
  end

  it 'throws an error if the input array is too small' do
    array_short = [44]
    expect{stock_picker(array_short)}.to raise_error(InputError)
  end

  it 'returns the first max profit if there are two' do
    array_multiple = [20, 40, 20, 40]
    expect(stock_picker(array)).to eq([0,1])
  end

  it 'throws an error if there is no profitable action' do
    array_none = [44, 20]
    expect{stock_picker(array)}.to raise_error(Error)
  end

end

