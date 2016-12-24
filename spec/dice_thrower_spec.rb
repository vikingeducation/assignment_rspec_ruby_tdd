require "dice_thrower"

describe DiceThrower do

	let(:a_game){DiceThrower.new}

	it 'initializes with 2 players and a rounds array' do
		expect(a_game.instance_variable_get(:@computer)).not_to be_nil
		expect(a_game.instance_variable_get(:@human)).not_to be_nil
		expect(a_game.instance_variable_get(:@rounds)).not_to be_nil
	end

	it 'starts at 0 wins for both players' do
		expect(a_game.instance_variable_get(:@num_wins_human)).to eq(0)
		expect(a_game.instance_variable_get(:@num_wins_computer)).to eq(0)
	end

	it 'calls the print instruction method when start game called' do
		expect(a_game).to receive(:print_instruction)
		a_game.start
	end

	it 'calls render' do
		allow(a_game.human).to receive(:gets).and_return("1", "q")
		expect(a_game).to receive(:render).at_least(:once)
		a_game.play
	end
	
end