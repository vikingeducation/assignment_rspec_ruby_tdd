require_relative '../lib/game'

describe Game do

  subject { Game.new }

  context "New Game" do
    it "creates a new game" do
      expect(subject).to be_a(Game)
    end
  end

  context "Before Game Loop" do

    let(:fake_human) { Human.new }
    let(:fake_computer) { Computer.new }

    it "prints instructions at start of new game" do
      expect{subject.start}.to output(/[Weclome]/).to_stdout
    end

    it "calls the #render  method" do
      expect(subject).to receive(:render)
      subject.start
    end

    it "sets human score as 0" do
      expect(fake_human.score).to eq(0)
    end

    it "sets computer score as 0" do
      expect(fake_computer.score).to eq(0)
    end
  end

end

describe Human do

  subject { Human.new }

  context "Human Player" do
    it "creates a human player" do
      expect(subject).to be_a(Human)
    end
  end

  context "Get Input" do

    it "accepts a positive integer" do
      allow(subject).to receive(:gets).and_return("1")
      expect(subject.get_input).to eq(1)
    end

    it "raises error for invalid input" do
      allow(subject).to receive(:gets).and_return("jello")
      expect{subject.get_input}.to raise_error("Invalid Input")
    end
  end
end

describe Computer do
  context "Computer Player" do
    it "creates a computer player" do
      expect(subject).to be_a(Computer)
    end
  end
end
