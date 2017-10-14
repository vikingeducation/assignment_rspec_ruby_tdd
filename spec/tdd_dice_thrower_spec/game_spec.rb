require 'tdd_dice_thrower/game'
require 'tdd_dice_thrower/human_player'

describe Game do 
  let(:game) { Game.new }
  let(:human_player) { HumanPlayer.new }

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
      expect(game.human_wins).to eql(0)
    end

    it 'intializes computer_wins to 0' do 
      expect(game.computer_wins).to eql(0)
    end
  end

end