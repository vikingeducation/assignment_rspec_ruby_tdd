require_relative "../dice_thrower.rb"
describe Dice do
  describe "#roll with default" do
    it "returns random value greater than or eq 1" do
      expect(Dice.roll).to be >= 1
    end
    it "returns random value less than or eq 6" do
      expect(Dice.roll).to be <= 6
    end
    it "returns random value between 1..6" do
      expect(Dice.roll).to be_between(1,6)
    end
  end
  describe "#roll with n = 7" do
    it "returns random value > 6" do
      expect(Dice.roll(7)).to be >= 6
    end
  end
end

describe Player do
  describe "#initialize" do
    let(:computer) { Player.new(:computer) }

    it "creates a player" do
      expect(subject).to be_a(Player)
    end
    it "creates a :human player" do
      expect(subject.name).to eq(:human)
    end
    it "creates a :computer player" do
      expect(computer.name).to eq(:computer)
    end

    it "init current_score to 0" do
      expect(computer.current_score).to eq 0
    end
    it "init num_wins to 0" do
      expect(computer.num_wins).to eq 0
    end

  end
  describe "#current_score" do
    let(:computer) { Player.new(:computer) }
    it "check if current_score is between 1 and 6 after a dice roll" do
      computer.roll_dice
      expect(computer.current_score).to be_between(1,6)
    end
  end
  describe "#incr_wins" do
    let(:computer) { Player.new(:computer) }
    it "incr the win by 1" do
      expect { computer.incr_wins }.to  change { computer.num_wins }.by(1)
    end
  end
  describe "#roll_dice" do
    let(:computer) { Player.new(:computer) }
    it "calls dice.roll" do
      expect(Dice).to receive(:roll)
      computer.roll_dice
    end
    it "updates the current_score of the player with the value returned from dice.roll" do
      computer.roll_dice
      expect(computer.current_score).to be_between(1,6)
    end
  end
  describe "#get_num_dice" do
    let(:human) { Player.new(:computer) }
    it "gets the number of dice to use from human" do
      allow(human).to receive(:gets).and_return("3\n")
      expect(human.get_num_dice).to eq(3)
    end
    # it "will accept values only between 1 and 10" do
    #   allow(human).to receive(:gets).and_return("11\n", "3\n", "q")
    #   expect{ human.get_num_dice }.to raise_error(RuntimeError)
    # end
  end

end

describe Game do
  describe "#initialize" do
    it "init 2 players, :human and :computer" do
      expect(subject.player1).to be_a(Player)
    end
    it "init 2 players, :human and :computer" do
      expect(subject.player2).to be_a(Player)
    end
    it "player 1 is a :human" do
      expect(subject.player1.name).to eq(:human)
    end
    it "player 2 is a computer" do
      expect(subject.player2.name).to eq(:computer)
    end
  end

  describe "#calculate_winner" do
    it "returns nil if both players have same score" do
      player1 = Player.new(:human)
      player2 = Player.new(:computer)
      expect(subject.calculate_winner(player1, player2)).to eq(nil)
    end

    it "returns player1 if player1 is the winner" do
      player1 = instance_double("Player", :current_score => 6)
      player2 = instance_double("Player", :current_score => 4)
      expect(subject.calculate_winner(player1, player2)).to eq(player1)
    end
    it "returns player2 if player2 is the winner" do
      player1 = instance_double("Player", :current_score => 3)
      player2 = instance_double("Player", :current_score => 17)
      expect(subject.calculate_winner(player1, player2)).to eq(player2)
    end
  end

  describe "#print_score" do
    it "prints the current wins of both players" do
      expect(subject).to receive(:puts).exactly(8).times
      subject.print_score
    end
  end

end