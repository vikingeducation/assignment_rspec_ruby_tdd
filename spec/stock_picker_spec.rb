
require 'stock_picker'

describe "StockPicker" do 

  let(:stock_picker){StockPicker.new()}

  describe "#pick" do

    it "checks that an array is passed" do
        expect{stock_picker.pick("10 20 30")}.to raise_error("Array not passed")
    end

    it "checks that an array elements are Numeric" do
        expect{stock_picker.pick([10,20,"dhdh"])}.to raise_error("Array elements should be numeric and positive")
    end

    it "checks that an array elements are positive" do
        expect{stock_picker.pick([10,20, -1])}.to raise_error("Array elements should be numeric and positive")
    end

    it "checks the minimum array length is 2" do
        expect{stock_picker.pick([10])}.to raise_error("Array size shuold be a minimum of 2")
    end  
  end

  describe "#output" do

    it "checks that an array of length is returned" do
        expect(stock_picker.pick([10,20]).length).to eq(2)
    end

    it "first index is larger then second" do
        expect(stock_picker.pick([10,20])[1]).to  be > stock_picker.pick([10,20])[0]
    end

  end

  # describe "checks for input information" do

  #   it "checks the minimum array length is 2" do

  #      expect(stock_picker.pick([10])).to be >= 2

  #   end

  # end
end   