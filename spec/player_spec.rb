require 'player'
require 'human'
require 'computer'

describe Player do
  let (:player ) { Player.new }

  describe '#initialize' do
    it 'initializes properly' do
      expect(player).to be_an_instance_of(Player)
    end

    it 'initializes with dice set to nil' do
      expect(player.dice).to eq(nil)
    end

    it 'initializes with score 0' do
      expect(player.score).to eq(0)
    end
  end

  describe '#.build_human_player' do
    it "creates instance of human class" do
      expect(Player.build_human_player).to be_an_instance_of(Human)
    end
  end

  describe '#.build_computer_player' do
    it "creates instance of computer class" do
      expect(Player.build_computer_player).to be_an_instance_of(Computer)
    end
  end

  describe '#throw_dice' do
    it 'returns int when dice number specified' do
      player.dice = 3
      expect(player.throw_dice).to be_an_instance_of(Fixnum)
    end
  end
end