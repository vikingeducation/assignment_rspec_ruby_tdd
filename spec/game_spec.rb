# rspec/game_spec.rb
require 'game'

describe Game do

  it "is a Game instance" do
    expect( subject ).to be_a( Game )
  end

  describe "#check who won game" do
    it "checks for the winner" do
      expect(subject).to receive(:check_who_won)
      subject.check_who_won
    end

    it "calls a Game method to check if the game is won" do
      expect_any_instance_of(Game).to receive(:check_who_won)
      subject.check_who_won
    end
  end

 describe "#play" do
    it "checks if the game starts with the play method" do
      expect_any_instance_of(Game).to receive(:play)
      subject.play
    end
  end
end