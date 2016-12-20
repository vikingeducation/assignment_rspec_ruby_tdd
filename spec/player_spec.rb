require "player"

describe Player do

	let(:human)   {Player.new}
	let(:computer){Player.new("Computer")}

	it 'initializes to a human player by default' do
		expect(human.type).to eq("Human")
	end

	it 'sets the current score to 0 by default' do
		expect(human.current_score).to eq(0)
	end

	it 'initializes to a computer player when type is computer' do
		expect(computer.type).to eq("Computer")
	end

	it 'human player can make a choice of how many dice to throw' do
		expect(human).to receive(:gets).and_return("kkkhhhhh","0", "qwd", "3")
		expect(human.make_choice).to eq(3)
	end

	it 'throws error if type is not valid' do
		expect{Player.new("Invalid")}.to raise_error("Bad player type specified")
	end

	it 'can calculate current score if human' do
		human.play(3)
		expect(human.current_score).to be_between(3, 18).inclusive
	end

	it 'can calculate current score if computer' do
		computer.play(3)
		expect(computer.current_score).to be_between(3, 18).inclusive
	end
	
end