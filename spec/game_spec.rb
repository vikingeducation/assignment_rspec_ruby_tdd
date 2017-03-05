# spec/game_spec.rb

require 'game'
include DiceThrower

describe "Game" do
  let (:game) { Game.new }

  describe "#initialize" do
    it "creates an instance of Game" do
      expect(game).to be_a(Game)
    end

    it "creates an instance of Human in the Game instance" do
      expect(game.human).to be_a(Human)
    end

    it "creates an instance of Computer in the Game instance" do
      expect(game.computer).to be_a(Computer)
    end

    it "sets the Human's score to 0" do
      expect(game.human_score).to eq(0)
    end

    it "sets the Computer's score to 0" do
      expect(game.computer_score).to eq(0)
    end
  end

  describe "human" do
    it "cannot be modified after it's set on initialize" do
      expect { game.human = nil }.to raise_error(NoMethodError)
    end
  end

  describe "computer" do
    it "cannot be modified after it's set on initialize" do
      expect { game.computer = nil }.to raise_error(NoMethodError)
    end
  end

  describe "human_score" do
    it "cannot be modified publically after it's set on initialize" do
      expect { game.human_score += 1}.to raise_error(NoMethodError)
    end
  end

  describe "computer_score" do
    it "cannot be modified publically after it's set on initialize" do
      expect { game.computer_score += 1}.to raise_error(NoMethodError)
    end
  end

  describe "#increment_human_score" do
    it "increases the Human's score by one" do
      game.increment_human_score
      expect(game.human_score).to eq(1)
    end
  end

  describe "increment_computer_score" do
    it "increases the Computer's score by one" do
      expect(game.increment_computer_score).to eq(1)
    end
  end

  describe "#tie?" do
    it "returns true if the Human's roll and Computer's roll are equal" do
      human_double = instance_double("Human", roll_dice: 18)
      computer_double = instance_double("Computer", roll_dice: 18)
      game = Game.new(human_double, computer_double)

      expect(game.tie?(human_double.roll_dice, computer_double.roll_dice)).to be_truthy
    end
  end

  describe "#over?" do
    it "returns true if the Human player's last_input is 'q'" do
      # using a double
      human_double = instance_double("Human", times_to_roll: 'q')
      
      game_with_double = Game.new(human_double)
      expect(game_with_double.over?).to be_truthy

      # using an actual Human object
      allow(game.human).to receive(:print).and_return(nil)
      allow(game.human).to receive(:gets).and_return('q')
      game.human.get_input
      expect(game.over?).to be_truthy
    end
  end

  describe "#quit" do
    it "quits the game" do
      expect { game.quit }.to raise_error(SystemExit)
    end
  end
end