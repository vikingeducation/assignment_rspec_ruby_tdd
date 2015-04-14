require('towers')

# Tests for Towers of Hanoi. NOT the board.
describe TowersOfHanoi do
	let(:t){TowersOfHanoi.new(4)}

	it 'creates a new TowersOfHanoi object' do
		expect{TowersOfHanoi.new(3)}.to_not raise_error
	end

	it 'throws error if not given height' do
		expect{TowersOfHanoi.new}.to raise_error
	end

	it 'can access the @height' do
		expect(t.height).to be > 0
	end

	it 'outputs error if gets a word input' do
		expect(t.is_valid?("spoon,1")).to eq(false)
	end

	it 'outputs error if input not 1,2 or 3' do
		expect(t.is_valid?("4,1")).to eq(false)
	end

	it 'outputs error if given too many inputs' do
		expect(t.is_valid?("1,4,1")).to eq(false)
	end

	it 'outputs error if given too few inputs' do
		expect(t.is_valid?("1")).to eq(false)
	end

	it 'outputs error if first input has no items' do
		expect(t.is_valid?("2,1")).to eq(false)
	end
end