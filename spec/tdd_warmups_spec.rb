require 'tdd_warmups'

describe "#stock_picker" do
  let(:argument) { [44, 30, 24, 32, 35, 30, 40, 38, 15] }

  it "takes an array as an argument" do
    expect(argument).to be_a(Array)
  end

  it "raises an error when the argument is empty" do
    empty_arr = []
    expect{ stock_picker(empty_arr) }.to raise_error("Cannot pass empty array.")
  end

  it "raises an error when the array has only one stock price" do
    one_stock = [1]
    expect{ stock_picker(one_stock) }.to raise_error("Cannot pass array with one element.")
  end

  it "conducts a search on the array argument" do
    expect(argument).to receive(:each_index)
    stock_picker(argument)
  end

  it "checks each day for the most profitable one" do
    
    #compare_prices(buff,curr)
  end

  it "it bases the state of being profitable on the 
      difference between sale price on a day and buying 
      price on another" do
  end

  # it "test 1: checks for the most profitable day for buying and selling stock" do
  # end

  # it "test 2: checks for the most profitable day for buying and selling stock" do
  # end

end