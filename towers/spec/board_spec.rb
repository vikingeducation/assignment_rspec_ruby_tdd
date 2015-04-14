require('board')

# Tests for the Board of Towers of Hanoi
describe Board do
	let(:b){Board.new(4)}

	it 'playing renders the board' do
		expect(b).to receive(:print)
		b.render
	end	

	it 'can clear the screen' do
		expect{b.clear}.to_not raise_error
	end

	it 'rendering the board calls clear' do
		expect(b).to receive(:clear)
		b.render
	end

	describe "#move" do
		it 'moves the board around properly' do
			b.move([1,2])
			expect(b.board).to eq([[2,3,4],[1],[]])
		end

		it 'moves the board around properly more' do
			b.move([1,2])
			b.move([1,3])
			expect(b.board).to eq([[3,4],[1],[2]])
		end
	end

	describe "#is_victory?" do

		it 'returns true with winning board' do
			# QUESTION: Is this a valid way to do this?
			b.instance_variable_set(:@board, [[],[],[1,2,3,4]])
			expect(b.is_victory?).to eq(true)
		end
		
		it 'returns false with other board' do
			b.instance_variable_set(:@board, [[],[1],[2,3,4]])
			expect(b.is_victory?).to eq(false)
		end
	end
end