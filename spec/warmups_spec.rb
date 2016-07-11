require 'warmups'

describe '#stock_picker' do

  it 'raises an error if input is not an array' do
    expect{stock_picker(5)}.to raise_error(ArgumentError)
  end

  it 'raises an error if array is of length one' do
    expect{stock_picker([1])}.to raise_error(ArgumentError)
  end

  it 'raises an error if array contains non-fixnums' do
    expect{stock_picker(["bananna", "bananna", "bananna"])}.to raise_error(ArgumentError)
  end

  it 'raises an error if array is the same throughout' do
    expect{stock_picker([1, 1, 1, 1, 1])}.to raise_error("There are no profits to be made here")
  end
end
