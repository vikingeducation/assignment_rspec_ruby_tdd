require('board')

# Tests for the Board of Towers of Hanoi
describe Board do

	describe "#render" do
		before(:each) do
      allow(Board).to receive(:print).and_return(nil)
    end

		# it 'calls the print method' do
		# 	expect(subject).to receive(:print)
		# 	subject.render
		# end	

		# it 'can clear the screen' do
		# 	expect(subject.clear).to_not output(//).to_stdout
		# end

		it 'calls clear' do
			expect(subject).to receive(:clear)
			subject.render
		end
	end

	describe "#move" do
		it 'can make a move' do
			subject.move([1,2])
			expect(subject.get_board).to eq([[2,3],[1],[]])
		end

		it 'can make multiple moves' do
			subject.move([1,2])
			subject.move([1,3])
			expect(subject.get_board).to eq([[3],[1],[2]])
		end
	end

	describe "#is_victory?" do

		it 'returns true with winning board' do
			allow(subject).to receive(:get_board).and_return([[],[],[1,2,3]])
			expect(subject.is_victory?).to eq(true)
		end
		
		it 'returns false with other board' do
			allow(subject).to receive(:get_board).and_return([[],[1],[2,3]])
			expect(subject.is_victory?).to eq(false)
		end
	end
end