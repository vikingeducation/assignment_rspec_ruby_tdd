describe Warmups do

  let(:warmups){ Warmups.new }
  let(:prices){ [ 44, 30, 24, 32, 35, 30, 40, 38, 15 ] }
  let(:not_prices) { [ 44, 30, "two", 5] }
  let(:neg_prices) { [-2, -8, -3] }

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

    it 'requires all prices to be positive' do
      expect{warmups.stock_picker(neg_prices)}.to raise_error("All prices must be positive")
    end

    it 'returns an array' do
      expect(warmups.stock_picker(prices)).to be_an(Array)
    end

    it 'returns an array of 2 numbers' do
      expect(warmups.stock_picker(prices).length).to eq(2)
    end

    it 'returns the correct days for any  acending set of 2 prices' do
      expect(warmups.stock_picker([1,2])).to eq([0,1])
      expect(warmups.stock_picker([1,3])).to eq([0,1])
    end

    it "finds the buy and sell date for a set of increasing prices" do 
      expect(warmups.stock_picker([1,2,3])).to eq([0,2])
    end

    it "finds the buy and sell date for a set of congruent prices" do 
      expect(warmups.stock_picker([8,8,8])).to eq([0,1])
    end

    it "finds the buy sell date for a set of descending prices" do 
      expect(warmups.stock_picker([12,2,1])).to eq([1,2])
    end
  end
end