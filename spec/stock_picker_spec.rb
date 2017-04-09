require 'spec_helper'
require 'stock_picker'

describe StockPicker do

  let(:s) { StockPicker.new }

	describe "#stock_picker" do 

		it "raises error if stock prices are not an array" do 
			expect{s.stock_picker("hello")}.to raise_error("Error")
		end
		it "it returns first element of array if array length is one" do
			expect(s.stock_picker([1])).to eq(1)
		end
		

	end
	

end