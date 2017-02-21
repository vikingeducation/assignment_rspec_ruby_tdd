require "warmups"

describe "warmups" do

  describe "stock_picker" do
    it "returns the buy and sell days of most profit" do
      result = stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
      expect(result).to eq({buy: 2, sell: 6, profit: 16})
    end
  end

  describe "anagrams" do
    it "returns an array of anagrams that can be made with the specified string" do
      result = anagrams("looter", %w(spooky retool rootle tooler toddler))
      expect(result).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end
  end

end
