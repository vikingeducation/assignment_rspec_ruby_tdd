require_relative '../lib/game'

describe Game do

  let(:game) { Game.new }
  let(:human) { Human.new }
  let(:computer)   { Computer.new }

  context "New Game" do
    it "creates a new game" do
      expect(game).to be_a(Game)
    end

    it "creates a human player" do
  	  expect(game.human).to be_a(Human)
  	end

  	it "creates a computer player" do
  	  expect(game.computer).to be_a(Computer)
  	end
  end

  context "Game Methods" do
    it "#generate_play calls #check_winner" do
      expect(game).to receive(:check_winner)
      game.generate_play(9)
    end

    it "#check_input calls #generate_play" do
      expect(game).to receive(:generate_play).with(10)
      game.check_input("10")
    end
  end

end

describe Human do

  let(:human) { Human.new }
  let(:game) { Game.new }

  context "New Human Player" do
    it "has 0 current points" do
      expect(human.current).to eq(0)
    end

    it "has 0 total points" do
      expect(human.score).to eq(0)
    end

    it "accepts human input with #get_input" do
      expect(human).to receive(:gets).and_return("2")
      human.get_input
    end

  end

end

describe Computer do

  let(:computer) { Computer.new }

  context "New Computer Player" do
    it "has 0 current points" do
      expect(computer.current).to eq(0)
    end

    it "has 0 total points" do
      expect(computer.score).to eq(0)
    end
  end
end
