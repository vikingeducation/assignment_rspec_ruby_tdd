require 'player'
require 'dice'

describe Player do

  let(:p){Player.new}

  describe '#initialize' do
    it "should initialize with score of 0" do
      expect(p.score).to eq(0)
    end

    it "should initialize with throw count 0" do
      expect(p.throw).to eq(0)
    end
  end

  describe '#choose_number' do
    it "should return an integer" do
      allow(STDIN).to receive(:gets).and_return('10')
      expect(p.choose_number).to be_an(Integer)
    end
  end

  describe '#throws' do
    it "calls roll method on Dice" do
      expect(Dice).to receive(:roll)
      p.throws
    end
  end

  describe '#play_again?' do
    it "should return true when input is 'y'" do
      allow(STDIN).to receive(:gets).and_return('y')
      expect(p.play_again?).to be true
    end

    it "should return false when input is 'n'" do
      allow(STDIN).to receive(:gets).and_return('n')
      expect(p.play_again?).to be false
    end
  end

  describe '#scores' do
    it "increases score by 1" do
      expect{p.scores}.to change{p.score}.by(1)
    end
  end
end

