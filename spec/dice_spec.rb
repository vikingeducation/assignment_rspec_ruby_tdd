require_relative '../lib/dice'

describe Game do

  let(:game) { Game.new }
  let(:player) { Player.new("Player 1") }

  it "starts with players score at 0" do
    expect(game.user_wins).to eq(0)
  end

  it "starts with computer score at 0" do
    expect(game.computer_wins).to eq(0)
  end
#Need help with play_game method testing -keeps getting hung up on gets.chomp in pick_dice method even if you stub out the method that calls pick_dice
  describe "#play_game" do

    it "calls instructions method" do
      user = Player.new("User")
      new_game = Game.new(user)
      allow(user).to receive(:get_number_of_dice).and_return(3)
      expect(game).to receive(:instructions)
      game.play_game
    end

  end

  describe "#get_score" do

    context "computer rolls higher than player" do

      it "increases computer score by one" do
        computer_roll_total = 13
        player_roll_total = 11
        @computer_wins = 0
        @player_wins = 0
        expect(game.get_score(11,13)).to eq(@computer_wins = 1)
      end

    end

    context "player rolls higher than computer" do

      it "increases player score by one" do
        computer_roll_total = 13
        player_roll_total = 16
        @computer_wins = 0
        @player_wins = 0
        expect(game.get_score(16,13)).to eq(@player_wins = 1)
      end

    end

  end

end


describe Player do

  let(:player) { Player.new("Player 1")}

  it "should take a string as an input and return it as name" do
    expect(player.name).to eq("Player 1")
  end

  it "should have a six sided dice for rolling" do
    expect(player.dice).to eq([1,2,3,4,5,6])
  end

  describe "#roll_dice" do

    it "should return an array" do
      expect(player.roll_dice(5)).to be_a_kind_of(Array)
    end

    context "given 3 dice" do

      it "should have three values in the array" do
        array = player.roll_dice(3)
        expect(array.size).to eq(3)
      end

      it "each value in array should be an integer" do
        array = player.roll_dice(3)
        expect(array[0]).to be_a_kind_of(Integer)
      end

      it "each value in returned array should be between the values of 1 and 6" do
        array = player.roll_dice(3)
        expect(array[1]).to be_between(1, 6)
      end

    end

  end

  describe "#get_sum" do

    context "given an array of dice rolls" do

      it "should return the sum of the value in the array" do
        array = [2,3,4,6]
        sum = 15
        expect(player.get_sum(array)).to eq(sum)
      end

    end

  end

  describe "#get_number_of_dice" do

    it "should return integer for number of dice they want to roll" do
      allow(player).to receive(:pick_dice).and_return(2)
      expect(player.get_number_of_dice).to be_a_kind_of(Integer)
    end

    it "should return an error if player chooses 0 dice" do
      allow(player).to receive(:pick_dice).and_return(0)
      expect{player.get_number_of_dice}.to raise_error("That is not a valid option")
    end

    it "should return an error if player enters something other than an integer" do
      allow(player).to receive(:pick_dice).and_return("e")
      expect{ player.get_number_of_dice }.to raise_error("That is not a valid option")
    end

    it "should exit the game if 'q' is entered" do
      allow(player).to receive(:pick_dice).and_return("q")
      expect(player.get_number_of_dice).to exit
    end

  end

end


describe Computer do

  let(:computer) { Computer.new("Computer") }

  context "inherits from Player class" do

    it { expect(computer).to be_a_kind_of(Player) }

  end

end
