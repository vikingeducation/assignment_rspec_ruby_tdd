describe Warmups do

  let(:warmups){ Warmups.new }
  let(:prices){ [ 44, 30, 24, 32, 35, 30, 40, 38, 15 ] }
  let(:not_prices) { [ 44, 30, "two", 5] }
  describe '#stock_picker' do

    it 'is a method on the Warmups class' do
      expect(warmups.respond_to?(:stock_picker)).to be true
    end

    it 'receives a list of stock prices' do 
      expect{ warmups.stock_picker(prices)}.not_to raise_error
    end

    it 'rejects an input that is not an array' do 
      expect{ warmups.stock_picker("not_array") }.to raise_error("Your input should be an array")
    end

    it 'requires all items in price list to be numbers' do 
      expect{warmups.stock_picker(not_prices)}.to raise_error("Make sure all prices are numbers")
    end

    it 'requires at least two prices' do 
      expect{warmups.stock_picker([1])}.to raise_error("You need at least two prices")
    end
  end
end