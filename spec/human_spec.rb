# spec/human_spec.rb

describe "Human" do
  describe "#initialize" do
    it "creates an instance of Human"

    it "sets the Human's name to 'Derp'"

    it "gives the Human a single dice"
  end

  describe "#name" do
    it "cannot be overwritten after it's set on initialize"
  end

  describe "#dice" do
    it "cannot be overwritten after it's set on initialize"
  end

  describe "#get_input" do
    it "returns the Human's input for valid integer inputs"

    it "returns the Human's input if it's 'q' (case-insensitive)"
  end

  describe "#roll_dice" do
    it "raises an error if the input is not a valid number"

    it "returns a value within the minimum and maximum values of the rolls"
  end
end