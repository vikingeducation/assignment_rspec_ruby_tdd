require 'tdd_warmups'
require 'spec_helper'



describe "#stock_picker(array)" do
  it "raises an error if the argument is not an array" do
    expect{stock_picker("BUNCH O NUMBERS")}.to raise_error
  end

  it "returns an array of two numbers" do
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15]).length).to eq(2)
  end

  it "returns the most profitable two days for two examples" do
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
  end

  it "returns the most profitable two days for a two examples" do
    expect(stock_picker([20, 41, 40, 15, 20, 30, 80, 20])). to eq([0,6])
  end

#  it "returns an array of more than one pair of profitable days" do
#    expect(stock_picker([10, 15, 20, 10, 15, 20])).to eq([[0,2],[3, 5]])
#  end

end
