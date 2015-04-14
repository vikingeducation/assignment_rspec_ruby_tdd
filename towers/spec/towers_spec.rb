require('towers')

# Tests for Towers of Hanoi. NOT the board.
describe TowersOfHanoi do
	describe "#initialize" do
		it 'creates Board of certain size' do
			expect(Board).to receive(:new).with(5)
			TowersOfHanoi.new(5)
		end

		it 'height set to 3 if not given height' do
			expect(subject.height).to eq(3)
			TowersOfHanoi.new
		end
	end

	describe "#is_valid?" do
		let(:board){ double(:render => nil, :is_victory? => true, :get_board => [[2,3,4],[1],[]]) }

    before do
      allow(Board).to receive(:new).and_return(board)
    end

		it 'returns false if input not 1,2 or 3' do
			expect(subject.is_valid?([4,1])).to eq(false)
		end

		it 'returns false if given too many inputs' do
			expect(subject.is_valid?([1,4,1])).to eq(false)
		end

		it 'returns false if given too few inputs' do
			expect(subject.is_valid?([1])).to eq(false)
		end

		it 'returns false if first input has no items' do
			expect(subject.is_valid?([3,1])).to eq(false)
		end

		it 'returns false if would result in illegal move' do
			expect(subject.is_valid?([1,2])).to eq(false)
		end

		it 'returns true with a valid input' do
			expect(subject.is_valid?([1,3])).to eq(true)
		end
	end

	describe '#victory_ending' do
		it 'puts YOU WIN to stdout' do
			expect{subject.victory_ending}.to output(/YOU WIN/).to_stdout
		end
	end

end