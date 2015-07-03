require 'stock_picker'

describe "#stock_picker" do

  it "should raise an error if not an array" do
    expect{stock_picker(1)}.to raise_error
  end

  it "should not raise an error if an array is passed" do
    array=Array.new
    expect{stock_picker(array)}.not_to raise_error
  end

  it "should return an array" do
    expect(stock_picker(Array.new).class).to be(Array)
  end

  it "should return an array with length 2" do
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15]).length).to be(2)
  end

  it "returns correct answer" do
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
  end

end