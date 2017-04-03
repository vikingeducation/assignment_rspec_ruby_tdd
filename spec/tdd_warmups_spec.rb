require "tdd_warmups"

describe "#tdd_warmups" do
  describe "#stock_picker" do
    it "return and array size 2" do
      expect(stock_picker.size).to eq(2)
    end

    it "returns the largest price difference" do
      expect(stock_picker).to eq([2, 6])
    end

    it "takes an array as input" do
      expect(stock_picker([0,1,2,3,7,4,5,6])).to eq([0,4])
    end

    it "takes an array as input" do
      expect(stock_picker([7,6,5,4,3,2,1,0])).to eq([])
    end

    it "should raise an error if input is not array" do
      expect{stock_picker("Wrong")}.to raise_error(ArgumentError)
    end

    it "should raise an error if an element is not an integer" do
      expect{stock_picker([0,1,2,3,"%",4,5,"6"])}.to raise_error(ArgumentError)
    end
  end
end
