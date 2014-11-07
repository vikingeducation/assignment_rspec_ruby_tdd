require 'toh'

describe TowerOfHanoi do

  describe '#board' do
    it "should be an array" do
      expect(subject.board).to be_a(Hash)
    end

    it "should start with all tiles on the first peg" do
      expect(subject.board["a"].length).to eq(3)
    end

    it "should populate with a specified number of tiles" do
      new_game = TowerOfHanoi.new(5)
      expect(new_game.board["a"].length).to eq(5)
    end
  end

  describe '#play' do
    it "should take player input" do
      allow(subject).to receive(:gets).and_return('ac')
      subject.stub(:win).and_return(true)
      expect(subject).to receive(:gets)
      subject.play
    end

    it "should send the inputs to a move method" do
      allow(subject).to receive(:move)
      subject.stub(:win).and_return(true)
      expect(subject).to receive(:move)
      subject.play
    end

    it "should stop when the player has won" do
      subject.stub(:gets).and_return('ac','ab','cb','ac','ba','bc','ac')
      subject.play
      expect(subject.board).to eq({"a" => [], "b" => [], "c" => [1, 2, 3]})
    end

    context '#move' do
      it "should re-request after invalid inputs" do
        expect{subject.move('12')}.to output(/nvalid/).to_stdout
      end

      context '#move' do
        it "should perform a valid move" do
          subject.move('ab')
          expect(subject.board).to eq({"a" => [1,2], "b" => [3], "c" => []})
        end

        context 'with an invalid move' do
          it "should not move a peg onto itself" do
            expect{subject.move('aa')}.to output(/nvalid/).to_stdout
          end

          it "should not move from an empty slot" do
            expect{subject.move('ba')}.to output(/nvalid/).to_stdout
          end

          it "should not move a larger onto a smaller piece" do
            subject.move('ab')
            expect{subject.move('ab')}.to output(/nvalid/).to_stdout
          end
        end
      end
    end
  end
end
