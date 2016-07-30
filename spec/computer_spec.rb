require 'computer.rb'

describe Computer do

  let(:computer){ Computer.new }

  it 'is a Computer' do
    expect(subject).to be_a(Computer)
  end

  context '#throw_dice' do
    it 'return vallue between 1~6 with 1 dice' do
      expect(computer.throw_dice 1).to be_between(1, 6)
    end
  end

end
