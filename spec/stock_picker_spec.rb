require 'stock_picker'

describe 'stock_picker' do
  let(:test){ [44, 30, 24, 32, 35, 30, 40, 38, 15] }
  let(:easy){ [15, 34, 26, 45, 23, 14, 56, 44]}

  it 'must take an array' do
    expect{ stock_picker('string')}.to raise_error(ArgumentError)
  end

  it 'returns an array' do
    expect( stock_picker([1,2])).to be_a(Array)
  end

  it 'first day must come before second day' do
    results = stock_picker(test)
    expect( results[-1]).to be > results[0]
  end

  it 'price on first day must be less than price on second day' do
    results = stock_picker(test)
    expect( test[results[0]]).to be < test[results[1]]
  end

  it 'returns the correct days' do
    expect( stock_picker([56, 44, 31, 20, 43, 18, 45])).to eq([5, 6])
  end

end
