require 'stock_picker'

describe "#stock_picker" do
    it "handle [10,30] input" do
      expect(stock_picker([10,30])).to eq([0,1])
    end

    it "return ArgumentError if input is too short" do
      expect{stock_picker([1])}.to raise_error(ArgumentError)
    end

    it "return ArgumentError if input is not Array" do
      expect{stock_picker("hello")}.to raise_error(ArgumentError)
    end

    it "handle [10,5,30] input" do
      expect(stock_picker([10,5,30])).to eq([1,2])
    end

    it "handle [10,10,10] input" do
      expect(stock_picker([10,10,10])).to eq([0,1])
    end

    it "handle [20,30,10] input" do
      expect(stock_picker([20,30,10])).to eq([0,1])
    end

    it "handle [44, 30, 24, 32, 35, 30, 40, 38, 15] input" do
      expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
    end

end

# stock_picker[10,30] should return [0,1]
# stock_picker[1] should return ArgumentError
# stock_picker[10,5,30] should return [1,2]
# stock_picker("hello") should raise ArgumentError
# stock_picker[30,20,40,10] should return [1,2]
# stock_picker[44, 30, 24, 32, 35, 30, 40, 38, 15] should return [2,6]