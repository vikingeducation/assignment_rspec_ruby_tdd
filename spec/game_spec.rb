require 'rspec'
require 'game'
require 'listener'

# sets two players
# get number of dice
# roll dice for human
# roll same number of dice for computer
# compare totals
# add tally for winner
# loop
# q to quit
describe "Game" do
  let (:renderer) { class_double("Render", tie: nil, win: nil, loss: nil) }
  let (:listener) { class_double("Listener") }
  let (:game) { Game.new(listener: listener, renderer: renderer) }

  before do
    allow(listener).to receive(:get_input).and_return(5, 5, "q")
  end

  describe "#set_dice" do

    it "gets the number of dice" do
      game.play
      expect(game.dice).to eq("q")
    end

  end
  describe "#play" do


    it "loops until someone quits" do
      expect(game).to receive(:roll_dice).exactly(10).times
      game.play
    end

    it "should track the player's score with each roll" do
      game.play
      expect(game.player1.score).to be >= 5
      expect(game.player2.score).to be >= 5
    end
    it "should declare a winner" do
      game.player1.score = 1_000_000
      game.play
      expect(game.player1.wins).to eq(2)
    end

  end
end