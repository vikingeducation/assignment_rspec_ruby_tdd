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
end