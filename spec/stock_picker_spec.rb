require 'stock_picker'

describe StockPicker do

  let( :sp ) { StockPicker.new}

  describe "#picker" do
    it "returns an error if you give it less than two days" do
      expect{ sp.picker([0]) }.to raise_error(ArgumentError)
    end

    it "returns two days" do
      function = sp.picker([16,22,13,14,51,46])
      expect(function.length).to eq(2)
    end


    it "returns day 1 and day 2 if there are only two days" do
      expect(sp.picker([0,10])).to eq([0,1])
    end


    it "doesn't pick the max profit if highest day comes first" do
      expect(sp.picker([3,1,1,1,2,2])).to eq([1,4])
    end

    it "doesn't return days when there's no positive profit" do
      expect(sp.picker([33,32, 31])).to eq([])
    end

    it "handles negative prices" do
      expect{sp.picker([4,-3,15,6,-10])}.to raise_error(NameError)
    end

    it "returns maximum profit" do
      expect(sp.picker([0,32,34,36])).to eq([0,3])
    end


  end


end


# # dictionary notes - assume that it takes two arguments

# # option 1: 
#   allow(File).to receive(:readlines).and_return(dictionary)
# # option 2:
#   let(:my_file_double) { double("File") }

#   before do
#       allow(File).to receive(:open).and_return(my_file_double)
#       allow(my_file_double).to receive(:readlines).and_return(["a", "b", "c"])
#       allow(my_file_double).to receive(:close)
#   end