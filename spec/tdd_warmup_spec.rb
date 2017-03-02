# spec/tdd_warmup_spec.rb

require_relative '../lib/tdd_warmup'

describe "Warmup" do
  let (:warmup) { Warmup.new }

  describe "stock_picker" do
    it "raises an error if the input is not an Array" do
      expect { warmup.stock_picker(Hash.new) }.to raise_error(/must be an array/)
    end

    it "raises an error if any of the items in the input array is not a number" do
      expect { warmup.stock_picker([1, 2, "Three"]) }.to raise_error(/only contain numbers/)
    end

    it "returns an empty array if the input array is empty" do
      expect(warmup.stock_picker([])).to eq([])
    end

    it "returns an empty array if the input array has less than 2 prices" do
      expect(warmup.stock_picker([55])).to eq([])
    end

    it "returns an empty array if the only possibilities are no profit or a loss" do
      expect(warmup.stock_picker([50, 50])).to eq([])
      expect(warmup.stock_picker([100, 50])).to eq([])
    end

    it "returns the most profitable pair of days to buy and then sell the stock" do
      expect(warmup.stock_picker([1, 100])).to eq([0, 1])
      expect(warmup.stock_picker([100, 50, 100])).to eq([1, 2])
      expect(warmup.stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2, 6])
    end

    it "handles prices that are floats" do
      expect(warmup.stock_picker([2.5, 50.3])).to eq([0, 1])
      expect(warmup.stock_picker([100, 50.4, 50.5])).to eq([1, 2])
    end
  end

  describe "anagrams" do
    it "returns an empty array if either of its arguments are empty" do
      expect(warmup.anagrams("", %w(herp derp))).to eq([])
      expect(warmup.anagrams("herpderp", [])).to eq([])
    end

    it "raises an error unless all of the items in the input array are strings" do
      expect { warmup.anagrams("herp", ["derp", 1]) }.to raise_error(/only contain strings/)
    end

    it "returns all possible anagrams in uppercase" do
      expect(warmup.anagrams("looter", %w(spooky retool rootle tooler toddler))).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end

    it "does not include the original word as an anagram" do
      expect(warmup.anagrams("lemon", %w(lemon melon))).to eq(["MELON"])
    end

    it "returns an empty array if there are no anagrams" do
      expect(warmup.anagrams("zygote", %w(spooky retool rootle tooler toddler))).to eq([])
    end
  end
end