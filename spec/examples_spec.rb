require 'examples'

describe Examples do
  describe "#stock_picker" do
    it "takes an array of numbers without raising error" do
      expect{subject.stock_picker([1,2,3])}.not_to raise_error
    end
    it "raises an error if not passed an array" do
      expect{subject.stock_picker("string")}.to raise_error(ArgumentError)
    end
    it "raises and error if strings in the array" do
      expect{subject.stock_picker(["string"])}.to raise_error(ArgumentError)
    end
    it "raises and error if array length is less than two" do
      expect{subject.stock_picker([1])}.to raise_error(ArgumentError)
    end
    it "returns an array of integers" do
      expect(subject.stock_picker([1,2])).to be_a(Array)
    end
    it "returns an array with length of two" do
      expect(subject.stock_picker([1,2]).length).to be(2)
    end
    it "returns the best two days to trade" do
      expect(subject.stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2, 6])
    end
    it "outputs a message if there's no increase in price" do 
      expect(subject).to receive(:puts)
      subject.stock_picker([1,1,1])
    end
    it "returns nil if there's no increase in price" do
      expect(subject.stock_picker([3,2,1])).to be_nil
    end
  end

  describe "#anagrams" do
    it "takes two arguments" do
      expect{subject.anagrams('', []).not_to raise_error}
    end
    it "takes a string and an array as arguments" do 

    end
  end

end
