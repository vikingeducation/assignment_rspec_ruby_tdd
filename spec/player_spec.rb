require 'rspec'
require 'player'

describe Player do
  let(:player) { Player.new }

  it "starts off with no score" do
    expect(player.score).to eq(0)
  end

  it "starts off with no wins" do
    expect(player.wins).to eq(0)
  end

  describe "#score" do
    it "sets and returns the players current score" do
      expect{ player.score = 5 }.not_to raise_error
      player.score = 5
      expect(player.score).to eq(5)
    end
  end

  describe "#wins" do
    it "returns the players total wins" do
      expect{ player.wins = 5 }.to raise_error(NoMethodError)
      expect(player.score).to eq(0)
    end
  end

  describe "won" do
    it "increases the players win count by 1" do
      player.won
      expect(player.wins).to eq(1)
    end
  end

end