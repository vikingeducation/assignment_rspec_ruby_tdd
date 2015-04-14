require('towers')

# Tests for Towers of Hanoi. NOT the board.
describe TowersOfHanoi do
	let(:t){TowersOfHanoi.new(4)}
	let(:@board){Board.new}

	it 'creates a new TowersOfHanoi object' do
		expect(TowersOfHanoi.new(3).class).to eq(TowersOfHanoi)
	end

	it 'throws error if not given height' do
		expect{TowersOfHanoi.new}.to raise_error
	end

	it 'can access the @height' do
		expect(t.height).to be > 0
	end

	describe "#is_valid?" do
		it 'outputs error if input not 1,2 or 3' do
			expect(t.is_valid?([4,1])).to eq(false)
		end

		it 'outputs error if given too many inputs' do
			expect(t.is_valid?([1,4,1])).to eq(false)
		end

		it 'outputs error if given too few inputs' do
			expect(t.is_valid?([1])).to eq(false)
		end

		it 'outputs error if first input has no items' do
			expect(t.is_valid?([2,1])).to eq(false)
		end

		it 'returns false if would result in illegal move' do
			t.instance_variable_get("@board").instance_variable_set("@board",[[2,3,4],[1],[]])
			expect(t.is_valid?([1,2])).to eq(false)
		end

		it 'returns true with a valid input' do
			expect(t.is_valid?([1,3])).to eq(true)
		end
	end

	describe '#victory_ending' do
		it 'puts YOU WIN to stdout' do
			expect{t.victory_ending}.to output(/YOU WIN/).to_stdout
		end
	end

end