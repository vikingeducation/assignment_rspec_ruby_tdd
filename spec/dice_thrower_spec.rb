require 'dice_thrower'

describe 'Game' do

	let(:game){ Game.new }
  let(:player){ Player.new }
  let(:computer){ Computer.new }


  describe '#initialize' do
    
    it 'creates a new player' do
      expect(player).to be_a(Player)
    end

    it 'creates a new computer player' do
      expect(computer).to be_a(Computer)
    end

    it 'sets player score to 0' do
      expect(player_score).to eq(0)
    end

    it 'sets computer score to 0' do
      expect(computer_score).to eq(0)
    end

  end

  describe '#play' do
    
    it 'calls the #instructions method' do
      allow(game).to receive(:instructions)
      expect(game).to receive(:instructions)
      game.play
    end

    it do

    end

  end

end

describe 'Player' do

end

describe 'Computer' do

end