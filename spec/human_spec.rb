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

  describe "#get_input" do
    it "returns the Human's input for valid integer inputs" do
      allow(human).to receive(:print).and_return(nil)
      allow(human).to receive(:gets).and_return("5")
      expect(human.get_input).to eq(5)
    end

    it "returns the Human's input as 'q' if it's 'Q'" do
      allow(human).to receive(:print).and_return(nil)
      allow(human).to receive(:gets).and_return("Q")
      expect(human.get_input).to eq("q")
    end

    it "returns the Human's input as 'q' if it's 'q'" do
      allow(human).to receive(:print).and_return(nil)
      allow(human).to receive(:gets).and_return("q")
      expect(human.get_input).to eq("q")
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