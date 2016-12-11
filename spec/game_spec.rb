require 'dice'
require 'player'
require 'game'

describe Game do

  let(:game){Game.new}

  describe '#initialize' do
    it "should create a human player" do
      expect(game.human).to be_a(Player)
    end

    it "should create a computer player" do
      expect(game.computer).to be_a(Player)
    end
  end
  
=begin
  describe '#play' do
    it "should call intro method" do
      expect(game).to receive(:intro)
      game.play
    end

    it "should call choose_number method on human" do
      expect(game.human).to receive(:choose_number).and_return(1)
      game.play
    end

    it "should call goodbye method" do
      expect(game).to receive(:goodbye)
      game.play
    end
  end
=end
end
