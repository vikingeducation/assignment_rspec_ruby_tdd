require 'stock_picker'

describe 'stock_pick' do
  context "input" do
    it "takes an array as an input" do
      expect{stock_pick([1,0])}.not_to raise_error
    end

    it "raises an error if innapropriate input" do
      expect{stock_pick(1)}.to raise_error
    end

    it "should take numbers for days" do
      expect{stock_pick([1,0])}.not_to raise_error
    end

    it "should raise error if array inputs are non-numeric" do
      expect{stock_pick([1,"yjiwo"])}.to raise_error
    end

    it "should not accept negative numbers" do
      expect{stock_pick([-1, 1])}.to raise_error(ArgumentError)
    end
  end

  context "output" do
    it "should return an array"
    it "should return exactly two days"
    it "should return days that maximize return"
    it "should return days in sequence"
    it "should return the pair with the fewest intervening days"
  end
end