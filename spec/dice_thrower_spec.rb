require 'dice_thrower.rb'

describe DiceThrower do

  before do
    allow(STDOUT).to receive(:puts)
  end

  it 'is a DiceThrower class' do
    expect(subject).to be_a(DiceThrower)
  end

  context '#play' do
    it 'calls player input method' do
      player = instance_double("Player", throw_dice: 12)
      allow(player).to receive(:input).and_return(2, 'q')
      new_game = DiceThrower.new(player: player)
      expect(player).to receive(:input)
      new_game.play
    end
    it 'break the loop when player input q' do
      player = instance_double("Player", input: 'q')
      new_game = DiceThrower.new(player: player)
      expect(new_game).to receive(:say_good_bye)
      new_game.play
    end
    it 'calls computer throw_dice method' do
      player = instance_double("Player", throw_dice: 12)
      computer = instance_double("Computer", :throw_dice)
      allow(player).to receive(:input).and_return(2, 'q')
      new_game = DiceThrower.new(player: player, computer: computer)
      expect(computer).to receive(:throw_dice)
      new_game.play
    end
    it 'calls the show_result method' do
      player = instance_double("Player", throw_dice: 12)
      computer = instance_double("Computer", throw_dice: 9)
      allow(player).to receive(:input).and_return(2, 'q')
      new_game = DiceThrower.new(player: player, computer: computer)
      expect(new_game).to receive(:show_result)
      new_game.play
    end
    it 'calls good_bye method' do
      player = instance_double("Player", input: 'q')
      new_game = DiceThrower.new(player: player)
      expect(new_game).to receive(:say_good_bye)
      new_game.play
    end
  end
end
