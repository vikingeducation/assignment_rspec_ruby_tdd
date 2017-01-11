require 'dice_thrower'

describe DiceThrower do
  before do
    allow(STDIN).to receive(:puts).and_return(nil)
  end
  describe '#initialize' do
    it 'should be a DiceThrower' do
      expect(subject).to be_a(DiceThrower)
    end
    it 'should have a default dice count of nil' do
      expect(subject.instance_variable_get(:@dice)).to eq(0)
    end
  end

  describe '#update_player_wins' do
    it 'updates player wins' do
      allow_any_instance_of(Player).to receive(:dice_throw).and_return(2, 3, 2, 3)

    end
  end

  describe '#print_score' do
    it 'calls view\'s print_score method' do
      expect_any_instance_of(View).to receive(:print_score)
      subject.print_score
    end
  end

  describe '#reset_round' do

    it 'sets dice to nil' do
      subject.instance_variable_set(:@dice, 5)
      subject.reset_round
      expect(subject.instance_variable_get(:@dice)).to eq(0)
    end

    it 'sets player dice throw to 0' do
      allow_any_instance_of(Player).to receive(:reset_dice_throw) do
        @counter ||= 0
        @counter += 1
      end
      subject.reset_round
      expect(@counter).to eq(2)
    end

  end


  describe '#welcome' do
    it 'greets the user' do
      expect{subject.welcome}.to output(/Welcome.*/).to_stdout
    end
  end

  describe '#get_dice_num' do

    it 'calls ask_for_dice_num' do
      allow(subject).to receive(:valid_num?).and_return(false, true)
      allow(subject).to receive(:gets).and_return('5')
      expect(subject).to receive(:ask_for_dice_num)
      subject.get_dice_num
    end

  end

  describe '#ask_for_dice_num' do

    it 'asks for user input' do
      allow(subject).to receive(:gets).and_return('4')
      expect(subject).to receive(:gets)
      subject.ask_for_dice_num
    end

    it 'returns the user input as an int' do
      allow(subject).to receive(:gets).and_return('1')
      expect(subject.ask_for_dice_num).to be_a(Integer)
    end

    it 'exits if input is "q"' do
      allow(subject).to receive(:gets).and_return('q')
      expect{subject.ask_for_dice_num}.to raise_error(SystemExit)
    end

  end

  describe '#valid_num?' do

    it 'returns false if move is nil' do
      subject.instance_variable_set(:@dice, nil)
      expect(subject.valid_num?).to eq(false)
    end

    it 'returns true if dice is between 1 and 5 inclusive' do
      subject.instance_variable_set(:@dice, 5)
      expect(subject.valid_num?).to eq(true)
    end
  end
end
