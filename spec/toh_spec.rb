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
    it "should take the player's input"

    it "should send the inputs to a move method" do
      allow(subject).to receive(:move)
      expect(subject).to receive(:move)
      subject.play
    end

    context '#move' do
      it "should re-request after invalid inputs" do
        expect{subject.move('12')}.to output(/nvalid/).to_stdout
      end

      context '#move' do
        it "should perform a valid move" do
          subject.move('ab')
          expect(subject.board).to eq({"a" => [1,1], "b" => [1], "c" => []})
        end

        context 'with an invalid move' do
          it "should not move a peg onto itself" do
            expect{subject.move('aa')}.to output(/nvalid/).to_stdout
          end
          it "should not move from an empty slot"
          it "should not move a larger onto a smaller piece"
        end
      end

      it "should display a victory message on completion"
    end
  end
end

# Board

# the game board should be an array with three arrays inside (happy)
# the game begins with all tiles on the left peg (happy)
# the game begins with a specified number of tiles (happy)

# Play

# the game takes inputs (happy)
# invalid inputs are requested again (sad)
# the inputs are sent to a move method (happy)
# valid moves are performed (happy)
# invalid moves fail (sad)...
#  -an empty slot cannot be moved from
#  -a larger piece cannot be placed on a smaller piece
# a completed game returns a victory message (happy)