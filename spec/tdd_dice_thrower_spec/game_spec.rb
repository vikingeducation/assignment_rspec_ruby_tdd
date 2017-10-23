require 'tdd_dice_thrower/game'
require 'tdd_dice_thrower/human_player'
require 'pry'

describe Game do 
  let(:game) { Game.new }
  let(:human_player) { HumanPlayer.new('Mike') }
  let(:computer_player) { HumanPlayer.new('Tron') }

  it 'is a Game' do 
    expect( subject ).to be_a( Game )
  end

  describe "#initialize" do 
    it 'intializes player_1 to a HumanPlayer' do 
      expect(game.player_1).to be_a(HumanPlayer)
    end

    it 'intializes player_2 to a ComputerPlayer' do 
      expect(game.player_2).to be_a(ComputerPlayer)
    end

    it 'intializes human_wins to 0' do 
      expect(game.human_wins).to eq(0)
    end

    it 'intializes computer_wins to 0' do 
      expect(game.computer_wins).to eq(0)
    end
  end

  describe "#play_again?" do 
    it "returns true if HumanPlayer enters 'yes'" do 
      allow(game).to receive(:gets).and_return('yes')
      expect(game.play_again?).to be true
    end

    it "returns false if HumanPlayer enters 'no'" do 
      allow(game).to receive(:gets).and_return('no')
      expect(game.play_again?).to be false
    end
  end

  describe "#compute_totals" do 
    before do 
      allow(game.player_1).to receive(:select_number_of_dice).and_return('3')
      allow(game.player_1).to receive(:roll_dice).with(game.number_of_dice).and_return([1, 2, 3])
      allow(game.player_2).to receive(:roll_dice).with(game.number_of_dice).and_return([2, 3, 4])
      game.compute_totals
    end
    it "calculates player_1's roll total" do 
      expect(game.player_1_total).to eq(6)
    end

    it "calculates player_1's roll total" do 
      expect(game.player_2_total).to eq(9)
    end
  end

  describe "#determine_winner" do 
    before do 
      game.player_1_total = 10
      game.player_2_total = 15
    end
    it "returns the name of the player with the bigger total" do
      expect(game.determine_winner).to eq('Kit')
    end

    it "increments the number of wins for the winning player" do 
      game.determine_winner
      expect(game.computer_wins).to eq(1)
    end
  end

  describe "#single_game" do 
    it "assigns value to @number_of_dice" do
      allow(game.player_1).to receive(:select_number_of_dice).and_return('5')
      expect(game.number_of_dice).to eq(5)
      game.single_game
    end

    it "calls #compute_totals" do 
      expect(game).to receive(:compute_totals)
      game.single_game
    end
  end

  describe "#play" do 
    it 'calls greeting' do 
      allow(game).to receive(:game_loop).and_return(nil)
      expect(game).to receive(:greeting).and_return(nil)
      game.play
    end
    it 'calls game_loop' do 
      expect(game).to receive(:game_loop).and_return(nil)
      game.play
    end
  end

end