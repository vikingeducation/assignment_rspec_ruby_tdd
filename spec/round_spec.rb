require "round"

describe Round do

	let(:a_round){Round.new}

	it 'initializes scores to 0 on init' do
		expect(a_round.human_score).to eq(0)
		expect(a_round.computer_score).to eq(0)
	end

	it 'can calculate winner when human has more scores' do
		a_round.human_score = 16
		a_round.computer_score = 12
		expect(a_round.winner).to eq(:human)
	end

	it 'can calculate winner when computer has more scores' do
		a_round.human_score = 13
		a_round.computer_score = 17
		expect(a_round.winner).to eq(:computer)
	end

	it 'can calculate winner when both have equal scores' do
		a_round.human_score = 23
		a_round.computer_score = 23
		expect(a_round.winner).to eq(:computer)
	end
end