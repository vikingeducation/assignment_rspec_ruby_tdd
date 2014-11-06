require 'toh'

describe TowerOfHanoi do

  describe '#board' do
    it "should be an array" do
      expect(subject.board).to be_a(Array)
    end

    it "should start with all tiles on the first peg" do
      expect(subject.board[0].length).to eq(3)
    end

    it "should populate with a specified number of tiles" do
      new_game = TowerOfHanoi.new(5)
      expect(new_game.board[0].length).to eq(5)
    end
  end

  describe '#play' do
    it "should take the player's input"
    it "should re-request after invalid inputs"
    it "should send the inputs to a move method"

    context '#move' do
      it "should perform a valid move"
      context 'with an invalid move' do
        it "should not move from an empty slot"
        it "should not move a larger onto a smaller piece"
      end
    end

    it "should display a victory message on completion"
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