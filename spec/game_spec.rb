require './lib/dice_thrower/game.rb'

describe Game do

  let (:game) { Game.new }
  let (:player) { Player.new }
  let (:human) { Human.new }


  describe "#play" do

    it "calls prints_instructions" do
      allow(game).to receive(:gets).and_return("2")
      expect(game).to receive(:print_instructions)
      game.play
    end

    it "calls user_input" do
      allow(human).to receive(:gets).and_return("2")
      expect(human).to receive(:user_input)
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







end