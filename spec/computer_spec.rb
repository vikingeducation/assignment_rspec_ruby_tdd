# spec/computer_spec.rb

require 'computer'
include DiceThrower

describe "Computer" do
  describe "#initialize" do
    it "creates an instance of Computer"

    it "sets the Computer's name to 'Skynet'"

    it "gives the Computer a single dice"
  end

  describe "name" do
    it "cannot be overwritten after it's set on initialize"
  end

  describe "dice" do
    it "cannot be overwritten after it's set on initialize"
  end

  describe "#roll_dice" do
    it "raises an error if the input is not a valid number"

    it "returns a value within the minimum and maximum values of the rolls"
  end
end