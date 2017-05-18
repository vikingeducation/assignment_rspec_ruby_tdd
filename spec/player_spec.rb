require 'player'
describe Player do
  let(:player) {Player.new}
  describe '#init' do
    it 'starts with round_total of 0 by default' do
      expect(player.round_total).to eq(0)
    end
    it 'starts with a running_total of 0 by default' do
      expect(player.running_total).to eq(0)
    end
  end
  describe '#turn' do
    it 'returns the round_total for number of dice rolled' do
      expect(player.turn(1)).to be_between(1, 6).inclusive
      expect(player.turn(2)).to be_between(2, 12).inclusive
      expect(player.turn(5)).to be_between(5, 30).inclusive
    end
  end
end
