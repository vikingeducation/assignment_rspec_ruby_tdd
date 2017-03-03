# spec/computer_spec.rb

require 'computer'
include DiceThrower

describe "Computer" do
  let (:computer) { Computer.new }

  describe "#initialize" do
    it "creates an instance of Computer" do
      expect(computer).to be_a(Computer)
    end

    it "sets the Computer's name to 'Skynet'" do
      expect(computer.name).to eq('Skynet')
    end

    it "gives the Computer a single dice" do
      expect(computer.dice).to be_a(Dice)
    end
  end

  describe "name" do
    it "cannot be overwritten after it's set on initialize" do
      expect { computer.name = 'HAL' }.to raise_error(NoMethodError)
    end
  end

  describe "dice" do
    it "cannot be overwritten after it's set on initialize" do
      expect { computer.dice = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#roll_dice" do
    it "raises an error if the input is not a valid number" do
      expect { computer.roll_dice("5") }.to raise_error(/input is invalid/)
    end

    it "returns a value within the minimum and maximum values of the rolls" do
      expect((3..18).to_a).to include(computer.roll_dice(3))

      test_rolls = []
      10000.times { test_rolls.push(computer.roll_dice(3)) }
      expect(test_rolls.all? { |roll| (3..18).to_a.include?(roll) }).to be_truthy
    end
  end
end