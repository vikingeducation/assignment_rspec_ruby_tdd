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
    expect(stock_picker([20, 41, 40, 15, 20, 30, 80, 20])). to eq([3,6])
  end

it "returns an array of more than one pair of profitable days" do
    expect(stock_picker([10, 15, 20, 10, 15, 20])).to eq([[0,2],[0,5], [3, 5]])
  end

end


describe "#anagrams" do 
  it "returns an array of anagrams that can be made with the string from the array" do
    expect(anagrams("looter", ["spooky, retool, rootle, tooler, toddler"])).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it "returns an array of anagrams that be made with a given string from an array with a second example" do
    expect(anagrams("car", ["rac", "acr"])).to eq(["RAC", "ACR"])
  end

  it "raises an error if the first argument is not a string" do
    expect{anagrams(4, ["word", "frog", "elephant"])}.to raise_error
  end

  it "raises an error if the second is not an array" do
    expect{anagrams("word", "THIS IS AN ARRAY")}.to raise_error
  end

  it "raises an error if string parameter has more than one word" do
    expect{anagrams("two words", ["This", "is", "an", "array"])}.to raise_error
  end

end
