require 'player'

describe Player do

  let(:human) { Player.build_human }
  let(:computer) { Player.build_computer }

  describe ".build_human" do
    it 'makes a human player' do
      expect(human).to be_a(Player)
    end
  end

  describe ".build_computer" do
    it 'makes a computer player' do
      expect(computer).to be_a(Player)
    end
  end

  describe '#initialize' do
    it 'names player "1" if human' do
      expect(human.name).to eq("1")
    end

    it 'names player "2" if computer' do
      expect(computer.name).to eq("2")
    end

    it 'gives player an instance of Dice' do
      expect(human.dice).to be_a(Dice)
    end

    it 'gives player an instance of score set to 0' do
      expect(human.score).to eq(0)
    end
  end

end
