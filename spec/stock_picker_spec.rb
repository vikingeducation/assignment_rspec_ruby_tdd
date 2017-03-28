require 'stock_picker'
describe 'stock_picker' do
  let(:prices) {[44, 30, 24, 32, 35, 30, 40, 38, 15]}
  it 'takes array of stock prices per day and outputs most profitable pair of days to buy and sell' do
    expect{stock_picker(prices)}.to output("2\n6\n").to_stdout
  end
end
