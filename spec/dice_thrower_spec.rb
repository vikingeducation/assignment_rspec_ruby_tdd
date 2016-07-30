require 'dice_thrower.rb'

describe DiceThrower do
  it 'is a DiceThrower class' do
    expect(subject).to be_a(DiceThrower)
  end

  context '#play' do
    it 'calls player to input' do
      player = instance_double("Player", input: )
      allow(player).to receive(:input)
      expect(player).to receive(:input)
    end
  end
end
