=begin

initiate game
unless input == 'q'
welcome player
explain rules

until input == 'q'
player 1 turn: ask how many dice will be rolled in this game
rolls all dice & records score
player 2 turn: rolls all dice & records score
compare round scores
determine round winner
award point to round winner
announce round winner
announce current game winner


=end

require 'dice_thrower'



describe Die do
  let(:qty_dice) { 3 }
  let(:sides) { 6 }
  let(:die) { Die.new(qty_dice, sides) }
  let(:player_name) { 'Player' }

  it("is a Die") { expect(die).to be_a(Die) }

  describe '#initialize' do
    it("raises an error if no argument is provided") { expect{ Die.new }.to raise_error(ArgumentError) }
    it("has a qty of 3") { expect(die.qty).to eq(qty_dice) }
    it("has 6 sides") { expect(die.sides).to eq(sides) }
  end

  describe 'roll' do
    it "selects a random number from within the range of dice sides" do
      die_range = (1..sides).to_a
      expect(die_range.include?(die.roll)).to eq(true)
    end
  end

  describe 'roll_all' do

    it 'adds each roll and returns the total' do
      allow(die).to receive(:qty).and_return(3)
      allow(die).to receive(:roll).and_return(1,5,4)
      expect(die.roll_all(player_name)).to eq(10)
    end

    it 'returns an integer' do
      expect(die.roll_all(player_name)).to be_a(Integer)
    end

    it 'calls #roll' do
      allow(die).to receive(:roll).and_return(3)
      expect(die).to receive(:roll).and_return(3)
      die.roll_all(player_name)
    end
  end
end



