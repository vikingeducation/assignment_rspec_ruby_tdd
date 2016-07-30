require 'dice_thrower.rb'

describe Player do

  let(:input_warning){ 'Input should be positive integer' }

  describe '#initialize' do
    it 'is a player' do
      expect( subject ).to be_a(Player)
    end
  end

  describe '#throw_dice' do
    it 'calls gets method for input' do
      allow(subject).to receive(:gets).and_return("3")
      expect(subject).to receive(:gets)
      subject.throw_dice
    end
    it 'return the a value between 1~6 for 1 dice' do
      allow(subject).to receive(:gets).and_return("1")
      100.times do
        subject.throw_dice
        expect( subject.throw_dice ).to be_between(1, 6)
      end
    end
    it 'return the the value between 3~18 for 3 dices' do
      allow(subject).to receive(:gets).and_return("3")
      100.times do
        subject.throw_dice
        expect( subject.throw_dice ).to be_between(3, 18)
      end
    end
    it 'return warning when input is 0' do
      allow(subject).to receive(:gets).and_return("0","3")
      expect( subject.throw_dice ).to receive(:puts).and_return(input_warning)
      subject.throw_dice
    end
    it 'return warning when input is negative' do
      allow(subject).to receive(:gets).and_return("-10", "3")
      expect( subject.throw_dice ).to receive(:puts).and_return(input_warning)
      subject.throw_dice
    end
    it 'raise error when input is float' do
      allow(subject).to receive(:gets).and_return("3.5", "3")
      expect{ subject.throw_dice }.to receive(:puts).and_return(input_warning)
      subject.throw_dice
    end
    it 'raise error when input is a string' do
      allow(subject).to receive(:gets).and_return("hello", "3")
      expect{ subject.throw_dice }.to receive(:puts).and_return(input_warning)
      subject.throw_dice
    end
  end

end
