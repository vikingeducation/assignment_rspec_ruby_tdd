require 'stock_picker'

describe "stockpicker" do
  let(:days1){[44, 30, 24, 32, 35, 30, 40, 38, 15]}
  let(:days2){[2, 8, 2, 8, 2, 8, 2, 8]}

  it 'returns most profitable days for buying then selling' do
    expect(stockpicker(days1)).to eq([2, 6])
  end

  it 'returns earliest pair of optimal days' do
    expect(stockpicker(days2)).to eq([0, 1])
  end

  it 'throws an error if input is not an array' do
    arr = String.new
  expect{stockpicker(arr)}.to raise_error(ArgumentError)
  end

  it 'throws an error if any inputs in array are not a number' do
    arr = [4, 6, "a"]
  expect{stockpicker(arr)}.to raise_error(ArgumentError)
  end

  it 'throws an error if input array has less than 2 entries' do
    arr = [4]
  expect{stockpicker(arr)}.to raise_error(ArgumentError)
  end

end
