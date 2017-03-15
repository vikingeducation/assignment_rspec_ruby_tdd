require "player"

describe Player do 
  
  let(:player){ Player.new }

  describe "#initialize" do 
    it "should create a new player without any arguments" do 
      expect{Player.new}.not_to raise_error
    end
  end

  describe "#ask_dice_number" do 
    before do 
      allow(player).to receive(:gets).and_return("3")
    end

    it "asks the player to input the number of dice to play with" do 
      expect{player.ask_dice_number}.to output("How many dice would you like to play with?\n").to_stdout
    end

    it "sets the number of dice the player wishes to roll to an instance variable" do   
      player.ask_dice_number
      expect(player.dice_number).to eq(3)
    end
  end

  describe "#valid?" do 
    it "should return true if number is 1 or greater" do 
      allow(player).to receive(:gets).and_return("3")
      player.ask_dice_number
      expect(player.valid?).to be true
    end

    it "returns false if number is 0 or less" do 
      allow(player).to receive(:gets).and_return("-1")
      player.ask_dice_number
      expect(player.valid?).to be false
    end

    it "returns false if a non-number is entered" do 
      allow(player).to receive(:gets).and_return("d")
      player.ask_dice_number
      expect(player.valid?).to be false
    end
  end

  describe "#roll" do
    it "should return a random number based on the number of dice rolled" do 
      allow(player).to receive(:gets).and_return("1")
      player.ask_dice_number
      expect(player.roll).to be_within(5).of(1)
    end
  end

end