require 'stock_picker'

describe 'stock_pick' do
  context "input" do
    it "takes an array as an input" do
      expect{stock_pick([1,0])}.not_to raise_error
    end

    it "should take numbers for days"
    it "should not accept negative numbers"
  end

  context "output" do
    it "should return an array"
    it "should return exactly two days"
    it "should return days that maximize return"
    it "should return days in sequence"
    it "should return the pair with the fewest intervening days"
  end
end