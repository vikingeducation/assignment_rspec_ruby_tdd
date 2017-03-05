# spec/human_spec.rb

require 'human'
include DiceThrower

describe "Human" do
  let (:human) { Human.new }

  describe "#initialize" do
    it "creates an instance of Human" do
      expect(human).to be_a(Human)
    end

    it "sets the Human's name to 'You'" do
      expect(human.name).to eq("You")
    end

    it "gives the Human a single dice" do
      expect(human.dice).to be_a(Dice)
    end

    it "sets the Human's last input to nil" do
      expect(human.last_input).to be_nil
    end
  end

  describe "#name" do
    it "cannot be overwritten after it's set on initialize" do
      expect { human.name = "Derpette" }.to raise_error(NoMethodError)
    end
  end

  describe "#dice" do
    it "cannot be overwritten after it's set on initialize" do
      expect { human.dice = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#last_input" do
    it "cannot be publicly modified" do
      expect { human.last_input = 42 }.to raise_error(NoMethodError)
    end
  end

  describe "#get_input" do
    it "gets input from the user" do
      allow(human).to receive(:print).and_return(nil)
      allow(human).to receive(:gets).and_return("3")
      expect(human).to receive(:gets)

      human.get_input
    end

    it "sets last_input accordingly if the user's input is a valid number" do
      allow(human).to receive(:print).and_return(nil)
      allow(human).to receive(:gets).and_return("3")

      human.get_input
      expect(human.last_input).to eq(3)
    end

    it "sets last_input accordingly if the user's input is either 'Q' or 'Q'" do
      allow(human).to receive(:print).and_return(nil)
      allow(human).to receive(:gets).and_return("Q")

      human.get_input
      expect(human.last_input).to eq("q")
    end

    it "asks the user for input again if the user has entered neither a valid number nor 'q'" do
      allow(human).to receive(:print).and_return(nil)
      allow(human).to receive(:puts).and_return(nil)
      allow(human).to receive(:gets).and_return("not valid", "3")

      human.get_input
      expect(human.last_input).to eq(3)
    end
  end

  describe "#roll_dice" do
    it "raises an error if the input is not a valid number" do
      expect { human.roll_dice("5") }.to raise_error(/input is invalid/)
    end

    it "returns a value within the minimum and maximum values of the rolls" do
      expect((3..18).to_a).to include(human.roll_dice(3))

      test_rolls = []
      10000.times { test_rolls.push(human.roll_dice(3)) }
      expect(test_rolls.all? { |roll| (3..18).to_a.include?(roll) }).to be_truthy
    end
  end
end