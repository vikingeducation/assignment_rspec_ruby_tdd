require 'tdd_warmups'

describe "#stock_picker" do
  let(:argument) { [44, 30, 24, 32, 35, 30, 40, 38, 15] }

  it "raises an error when the argument is empty" do
    empty_arr = []
    expect{ stock_picker(empty_arr) }.to raise_error("Cannot pass empty array.")
  end

  it "raises an error when the array has only one stock price" do
    one_stock = [1]
    expect{ stock_picker(one_stock) }
      .to raise_error("Cannot pass array with one element.")
  end

  it "returns the buy and sell dates that would yield the most profit" do
    expect(stock_picker(argument)).to eq([2,6])
  end

  it "returns all the words in an array that are anagrams of a string" do
    expect(anagrams("looter", ["spooky", "retool", "rootle", "tooler", "toddler"]))
            .to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end
end
