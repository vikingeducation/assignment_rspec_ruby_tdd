require 'stock_picker'

describe StockKing do

  let(:picker){StockKing.new}

  it 'is an instance of StockKing' do
    expect(subject).to be_a(StockKing)
  end

  describe '#stock_picker' do
    # It raises an error if no argument given.
    it 'raises an error if no argument is given' do
      expect{picker.stock_picker}.to raise_error(ArgumentError)
    end

    # It does not raise an error if an argument is given
    it "does not raise an error if an argument is given" do
      expect{picker.stock_picker([1,3,4,5,6,7,8,9])}.not_to raise_error
    end

    # It raises an error if argument is not an array
    it "raises an error if argument is not an array" do
      expect{picker.stock_picker("string")}.to raise_error(ArgumentError)
    end

    # It raises an error if argument array has items that are less than 1 or arenot Integers.
    it "raises an error if argument array has items that are smaller than 1" do
      expect{picker.stock_picker([0, 1, -1])}.to raise_error(ArgumentError)
    end

    # It raises an error if stocks contain anything except integers
    it "raises an error if stocks contain anything except integers" do
      expect{picker.stock_picker([3, 1.25, 4])}.to raise_error(ArgumentError)
    end

    # It raises an error if argument array contains less than 2 items
    it "raises an error if argument array cotains less than 2 items" do
      expect{picker.stock_picker([1])}.to raise_error(ArgumentError)
    end

    # It returns an array containing the index positions first off when best to buy and second when best to sell
    it "returns an array with the index positions of when best to buy and sell" do
      expect(picker.stock_picker([1,3,5])).to eq([0,2])
    end

    # It returns an array containing the index positions first off when best to buy and second when best to sell
    it "returns an array with the index positions of when best to buy and sell" do
      expect(picker.stock_picker([86,3,5,10,54,99,2,45])).to eq([1,5])
    end
  end
end
