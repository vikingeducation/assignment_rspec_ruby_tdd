require 'warmups'

describe "#stockpicker" do

  it "raises an error if argument isn't an array" do
    days = "stocks"
    expect{stock_picker(days)}.to raise_error ArgumentError
  end

  it "works for a normal selection of prices" do
    days = [44, 30, 24, 32, 35, 30, 40, 38, 15]
    expect(stock_picker(days)).to eq([2, 6])
  end

  it "works when prices fall every day" do
    days = [44, 30, 24, 22, 20, 15, 10, 5, 1]
    expect(stock_picker(days)).to eq([2, 3])
  end

  it "works when prices rise every day" do
    days = [10, 20, 40, 50, 60]
    expect(stock_picker(days)).to eq([0, 4])
  end

  it "raises an error if there is less than two days" do
    days = [10]
    expect{stock_picker(days)}.to raise_error ArgumentError
  end

  it "works if they are all equal" do
    days = [10, 10, 10, 10, 10]
    expect(stock_picker(days)).to eq([0, 1])
  end

  it "works if some prices are negative" do
    days = [44, 30, -24, 32, 35, -30, 40, 38, -15]
    expect(stock_picker(days)).to eq([5, 6])
  end
end

describe "#anagrams" do
  let(:word) { "looter" }
  let(:bad_word) { "zygote" }
  let(:dict) { ["spooky", "retool", "rootle", "tooler", "toddler"] }

  it "raises error if first argument is not a string" do
    expect{anagrams(2, dict)}.to raise_error ArgumentError
  end

  it "raises error if second argument is not an array" do
    expect{anagrams(word, 2)}.to raise_error ArgumentError
  end

  it "returns an empty array if there are no anagrams" do
    expect(anagrams(bad_word, dict)).to eq([])
  end

  it "returns an array of anagrams from a dictionary" do
    expect(anagrams(word, dict)).to eq(["retool", "rootle", "tooler"])
  end

  it "works even with mixed case" do
    expect(anagrams("LoOtEr", dict)).to eq(["retool", "rootle", "tooler"])
  end

  it "does not return the original word as one of the anagrams" do
    expect(anagrams("hello", ["hello"])).to eq([])
  end

  it "does not return anything for an empty string" do
    expect(anagrams("", dict)).to eq([])
  end
end

describe "#load_dictionary" do
  it "returns an array of all dictionary words" do
    expect(load_dictionary("lib/fake_dict.txt")).to eq(["spooky", "retool", "rootle", "tooler", "toddler"])
  end

  it "returns an error if the file can't be opened" do
    expect{load_dictionary("fake_dict.tt")}.to raise_error
  end
end