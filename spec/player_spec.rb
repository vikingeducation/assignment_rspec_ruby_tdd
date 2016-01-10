require './lib/dice_thrower/player.rb'


describe Player do

  let (:player) { Player.new }
  let (:player_with_6_dice) { Player.new(6) }

  describe "#initialize" do

    it "creates a new player with nil dice" do
      expect(player.dice.nil?).to be true
    end

    it "can create a new player with 6 dice" do
      expect(player_with_6_dice.dice).to eq(6)
    end

  end


  describe "#random_die" do

    it "rolls a die between 1 and 6" do
      expect(player.random_die).to be_between(1,6)
    end


  end


end