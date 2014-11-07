require 'stock_picker'

describe 'stock_pick' do
  context "input" do
    it "takes an array as an input" do
      expect{stock_pick([1,2])}.not_to raise_error
    end

    it "raises an error if innapropriate input" do
      expect{stock_pick(1)}.to raise_error
    end

    it "should take numbers for days" do
      expect{stock_pick([1,2])}.not_to raise_error
    end

    it "should raise error if array inputs are non-numeric" do
      expect{stock_pick([1,"yjiwo"])}.to raise_error
    end

    it "should not accept numbers less than or equal to 0" do
      expect{stock_pick([-1, 1])}.to raise_error(ArgumentError)
    end
  end

  context "output" do
    it "should return an array" do
      expect(stock_pick([2,3])).to be_a(Array)
    end

    it "should return exactly two days" do
      expect(stock_pick([2,3]).length).to eq(2)
    end
    it "should return days that maximize return" do
      expect(stock_pick([1,2,3,1])).to eq([0,2])
    end

    it "should return days in sequence"

    it "should return the pair with the fewest intervening days" do
      expect(stock_pick([1,4,2,4])).to eq([0,1])
    end
  end
end