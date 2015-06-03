require 'warmup'

describe Warmup do

  describe "#stock_picker" do

    it "accepts an input array of size 2 or larger" do
      expect{ subject.stock_picker([4,3,5]) }.not_to raise_error
    end

    it "rejects arrays that are shorter than 2" do
      expect{ subject.stock_picker([4]) }.to raise_error("Two or more days of prices required")
    end

    it "rejects input that is not an array" do
      expect{ subject.stock_picker("4,3,5") }.to raise_error("Input needs to be an Array")
    end

    it "returns [0, last index] if prices are strictly increasing" do
      expect(subject.stock_picker([3,5,7,9])).to eq([0,3])
    end

    it "raises an error if prices are strictly decreasing" do
      expect{ subject.stock_picker([9,7,5,3]) }.to raise_error("No profitable buy/sell option")
    end

    it "does not consider sell days happening on or before the buy day" do
      expect(subject.stock_picker([9,5,7,3])).to eq([1,2])
    end

    it "returns the earliest pair of days if there's a tie" do
      expect(subject.stock_picker([3,7,2,6])).to eq([0,1])
    end

  end

end