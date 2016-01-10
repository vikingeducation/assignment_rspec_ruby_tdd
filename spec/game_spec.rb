require './lib/dice_thrower/game.rb'

describe Game do

  let (:game) { Game.new }
  let (:player) { Player.new }
  let (:human) { Human.new }

  before do 
    allow(human).to receive(:gets).and_return("6")
  end

  describe '#initialize' do
    it "creates player1 as human, player2 as player" do
      expect(game.player1).to be_an_instance_of(Human)
      expect(game.player2).to be_an_instance_of(Player)
    end


  end


  describe "#play" do

    it "calls prints_instructions" do
      # allow(human).to receive(:gets).and_return("2")
      expect(game).to receive(:print_instructions)
      game.play
    end

    it "calls player_rolls_dice for both human and computer" do
      # allow(human).to receive(:gets).and_return("3")
      expect(game).to receive(:player_rolls_dice)
      expect(game).to receive(:player_rolls_dice)
      game.play
    end


  end


  describe '#player_rolls_dice' do

    it "calls random_die" do
      expect(player).to receive(:random_die).and_return(6)
      game.player_rolls_dice(1, player)
    end

    it "increases score by roll" do
      allow(player).to receive(:random_die).and_return(4)
      expect{game.player_rolls_dice(1, player)}.to change(player, :score).by(4)
    end

  end


  describe "#decide_winner" do

    let(:score1) { 20 }
    let(:score2) { 10 }

    it "picks player1 if their score is higher than player2" do
      expect(game.decide_winner(score1, score2)).to eq(20)
    end

    it "picks player2 if their score is higher than player1" do
      expect(game.decide_winner(score2, score1)).to eq(20)
    end

    it "doesn't pick a winner if it's a tie" do
      expect(game.decide_winner(score1, score1)).to be nil
    end

  end





end