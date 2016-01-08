require 'tdd_warmups'

describe '#stock_picker' do
  it 'returns a pair of days' do
    stock_prices = [1,4,5,6]
    expect(stock_picker(stock_prices).size).to eq 2
  end

  it 'returns the buy and sell indices which result in the greatest profit' do
    stock_prices = [1,4,5,6]
    expect(stock_picker(stock_prices)).to eq [0, 3]
  end

  it 'returns the correct result when the prices are out of order' do
    stock_prices = [7,1,5,4]
    expect(stock_picker(stock_prices)).to eq [1, 2]
  end

  it 'returns the correct result when there is no positive profit' do
    stock_prices = [4,2,-10,-33]
    expect(stock_picker(stock_prices)).to eq [0, 1]
  end

  it 'performs' do
    stock_prices = Array.new(99999) { |i| i }
    expect(stock_picker(stock_prices)).to eq [0, 99998]
  end

  it 'raises an error if the array has less than two values' do
    stock_prices = [4]
    expect{stock_picker(stock_prices)}.to raise_error ArgumentError
  end
end

# describe '#anagrams' do
#   it 'returns a list of anagrams for a given string' do
#     string = "Looter"
#     expected_output = %W{ RETOOL ROOTLE TOOLER}
#     expect(anagrams(string)).to eq expected_output
#   end
#
#   it 'doesnt return the original string' do
#     string = "Looter"
#     expected_output = %W{ RETOOL ROOTLE TOOLER}
#     expect(anagrams(string).include?(string.upcase)).to eq false
#   end
# end
