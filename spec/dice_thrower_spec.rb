require 'dice_thrower.rb'

describe DiceThrower do

  let(:new_game){ DiceThrower.new }

  it 'is a DiceThrower class' do
    expect(subject).to be_a(DiceThrower)
  end

  context '#play' do
    it 'calls player input method' do
      player = instance_double("player", :input)
      allow(player).to receive(:input).and_return(2)
      expect(player).to receive(:input)
      new_game.play
    end
    it 'calls good_bye method' do
      expect(new_game).to receive(:say_good_bye)
      new_game.play
    end
  end
end
