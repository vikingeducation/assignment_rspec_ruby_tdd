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

    it "has sub-arrays inside the board array" do
      expect(b.rods[1]).to be_an(Array)
    end

    #it "has all of the discs on the first rod"

  end


  describe "#process_move?" do
    let(:b) { Board.new(3) }

    context "if move is available" do

      it "makes a move to an empty rod" do
        expect(b.process_move?([1,3])).to be_truthy
      end

      it "makes a move to a rod with a larger top disc" do
        b.rods = [[5,4,3],[2],[1]]
        expect(b.process_move?([3,2])).to be_truthy
      end

      it "increases to_rod size by 1" do
        expect{ b.process_move?([1,3]) }.to change{b.rods[2].size}.by(1)
      end

      it "decreases from_rod size by 1" do
        expect{ b.process_move?([1,3]) }.to change{b.rods[0].size}.by(-1)
      end

    end  # context: move is available


    context "if move is not available" do

      it "rejects a move from an empty rod" do
        expect(b.process_move?([2,3])).to be_falsey
      end

      it "rejects a move to a rod with a smaller top disc" do
        b.rods = [[5,4,3],[2],[1]]
        expect(b.process_move?([1,2])).to be_falsey
      end

      #it "does not change @rods"

    end # context: move not available"

  end


  describe "#render" do

  end

end
