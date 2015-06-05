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


  describe "#anagrams" do

    context "with inputted argument" do

      it "accepts single word string inputs" do
        expect{ subject.anagrams("looter") }.not_to raise_error
      end

      it "raises an error for non-string input" do
        expect{ subject.anagrams(475) }.to raise_error("Input must be a string")
      end

      it "raises an error for multi-word input" do
        expect{ subject.anagrams("cheese puffs") }.to raise_error("Input must be a single word (no spaces)")
      end

    end


=begin  ### This feels untestable?  Moving on for now and will ask about later ###

    context "accessing dictionary" do
      #let(:dic) { "star\npots\nbread\ntars\nstop\nmeat" }
      #let(:dictionary) { ["star","pots","bread","tars","stop","meat"] }

      it "calls readlines on the dictionary" do  # did this actually test anything?
        dic = double("IO")
        allow(dic).to receive(:readlines).and_return(["star","pots","bread","tars","stop","meat"])
        expect{ (dic.readlines) }.not_to raise_error
      end

      it "raises an error if dictionary file cannot be accessed"

      it "loads dictionary words as elements in array"

    end
=end


    context "processing words" do

      it "returns all words that are anagrams" do
        expect(subject.anagrams("spot")).to eq(["pots","stop"])
      end

      it "returns nil if there are no anagrams" do
        expect(subject.anagrams("hand")).to eq([])
      end

      it "finds anagrams even if there are capital letters in the input" do
        expect(subject.anagrams("Rats")).to eq(["star","tars"])
      end

    end

  end

end