
require 'stock_picker'

describe "StockPicker" do 

  let(:stock_picker){StockPicker.new()}

  describe "#pick" do

    it "checks the minimum array length is 2" do
        expect{stock_picker.pick("10 20 30")}.to raise_error("Array not passed")
    end

    # it "checks the minimum array length is 2" do
    #     expect(stock_picker.pick).to be >= 2
    # end  
  end

  # describe "checks for input information" do

  #   it "checks the minimum array length is 2" do

  #      expect(stock_picker.pick([10])).to be >= 2

  #   end

  # end
end   