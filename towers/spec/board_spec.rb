require('board')

# Tests for the Board of Towers of Hanoi
describe Board do
	let(:t){TowersOfHanoi.new(4)}
	let(:b){Board.new(4)}

	it 'playing renders the board' do
		expect(b).to receive(:print)
		b.render
	end	

	it 'can clear the board' do
		expect{b.clear}.to_not raise_error
	end

	it 'rendering the board calls clear' do
		expect(b).to receive(:clear)
		b.render
	end

	it ''
end