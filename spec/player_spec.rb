require "player"

describe Player do
  let(:player){Player.new}
  describe "#initialize" do
    it "is initialized with a score of 0" do
      expect(player.score).to eq(0)
    end
  end
  describe "#roll_dice" do
    it "recieves an does not recieve anything other than integer" do
      expect{player.roll_dice("str")}.to raise_error(ArgumentError)
    end
    it "recieves an integer between 1-10" do
      expect{player.roll_dice(9)}.not_to raise_error
    end
    it "throws error if integer is greater than 10" do
      expect{player.roll_dice(11)}.to raise_error ArgumentError
    end
    it "rolls as many six sided dice as you tell it to" do
      expect(player.roll_dice(9).length).to eq(9)
    end
  end
  describe "calculate" do
    it "calculates add"
  end
end
