require 'stock_picker'
describe 'stock_picker' do
  let(:prices) {[44, 30, 24, 32, 35, 30, 40, 38, 15]}
  let(:price) {44}
  let(:one_price) {[44]}
  it 'takes array of stock prices per day and outputs most profitable pair of days to buy and sell' do
    expect{stock_picker(prices)}.to output("2\n6\n").to_stdout
  end
  it "returns correct profitable pair if first day is the highest price" do
    expect{stock_picker(prices)}.to output("2\n6\n").to_stdout
  end
  it "returns correct profitable pair if the last day is the lowest price" do
    expect{stock_picker(prices)}.to output("2\n6\n").to_stdout
  end
  it 'raises an error if arg is not an array' do
    expect{stock_picker(price)}.to raise_error
  end
  it 'raises an error if prices array is less than 2' do
    expect{stock_picker(one_price)}.to raise_error
  end
end
