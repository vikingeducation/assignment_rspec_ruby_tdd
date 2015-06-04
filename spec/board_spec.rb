require "board"

describe Board do

  describe "#initialize" do
    let(:b) { Board.new(5) }

    it "is an array" do
      expect(b.rods).to be_an(Array)
    end

    it "is an array of 3" do
      expect(b.rods.size).to eq(3)
    end

    it "has sub-arrays with size equal to number of discs" do
      expect(b.rods[1].size).to eq(5)
    end

  end


  describe "#render" do

  end

end
