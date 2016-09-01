require_relative '../lib/dice_thrower.rb'

describe DiceThrower do
  context '#play' do
    before do
      allow(STDOUT).to receive(:puts)
      allow_any_instance_of(Player).to receive(:get_num_dice).and_return(3)
    end

    it 'calls #welcome_message' do
      expect(subject).to receive(:welcome_message)
      subject.play
    end

    it 'calls #compare_scores' do
      expect(subject).to receive(:compare_scores).exactly(12).times
      subject.play
    end

    it 'calls #display_scores' do
      expect(subject).to receive(:display_scores).exactly(12).times
      subject.play
    end
  end
end

describe Dice do
  context '#roll' do
    it 'returns a random number between 1 and 6' do
      expect(1..6).to cover(subject.roll)
    end
  end
end

describe Player do
  before do
    allow(STDOUT).to receive(:puts)
  end
  let(:player){Player.new}

  describe '#get_num_dice' do
    it 'returns 1 if user input 1' do
      allow(player).to receive(:gets).and_return(1)
      expect(player).to receive(:gets)
      expect(player.get_num_dice).to eq(1)
    end
  end
end