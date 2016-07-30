require 'player.rb'

describe Player do

  before do
    allow(STDOUT).to receive(:puts)
  end
  let(:player){ Player.new }

  it 'is a player' do
    expect(subject).to be_a(Player)
  end

  context '#input' do
    it 'returns 1 if user input 1' do
      allow(player).to receive(:gets).and_return("1")
      expect(player).to receive(:gets)
      expect(player.input).to eq(1)
    end

    it 'return q if user input q' do
      allow(player).to receive(:gets).and_return("q")
      expect(player.input).to eq("q")
    end

    it 'get next value if user input is negative' do
      allow(player).to receive(:gets).and_return("-10", "-20", "3")
      expect(player.input).to eq(3)
    end

    it 'get next value if user input is a string' do
      allow(player).to receive(:gets).and_return("hello", "fuck", "5")
      expect(player.input).to eq(5)
    end

    it 'get next value if user input is a float' do
      allow(player).to receive(:gets).and_return("3.5", "4.3", "6")
      expect(player.input).to eq(6)
    end
  end

  context '#throw_dice' do
    it 'return 1~6 with 1 dice' do
      100.times do
        expect(player.throw_dice 1).to be_between(1, 6)
      end
    end

    it 'return 50~300 with 50 dices' do
      100.times do
        expect(player.throw_dice 50).to be_between(50, 300)
      end
    end
  end
end
