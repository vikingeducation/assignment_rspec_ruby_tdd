require 'spec_helper'
require 'tdd'

# 1 StockPicker
a = [2,3,1,4,5,3]
f = [5,4,3,2,1]
describe 'stock_picker' do
  it 'returns [4,6] from sample array' do
    expect(stock_picker(a)).to eq([3,5])
  end

  it 'returns an error if input not array' do
    expect{stock_picker("String")}.to raise_error(ArgumentError)
  end

  it 'returns an error if stock prices only rise' do
    expect{stock_picker(f)}.to raise_error(ArgumentError)
  end
end

describe 'anagrams' do
  dic = %w(spooky retool rootle tooler toddler)
  it 'returns anagrams of looter' do
    expect(anagrams("looter", dic)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it 'returns empty array if no anagrams available' do
    expect(anagrams("zygote", dic)).to eq([])
  end

  it 'raises error if input is not a string' do
    expect{anagrams(3, dic)}.to raise_error(ArgumentError)
  end
end
