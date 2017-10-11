require 'dice_thrower'



describe Die do
  before(:each) do
    allow( die ).to receive( :puts ).and_return( nil )
  end

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


describe Player do
  let(:player) { Player.new }

  it("is a Player") { expect(player).to be_a(Player) }

  describe '#initialize' do
    it("has a default round_score of 0") { expect(player.round_score).to eq(0) }
    it("has a default game_score of 0") { expect(player.game_score).to eq(0) }
  end
end


describe Human do
  let(:human) { Human.new }
  let(:computer) { Computer.new }

  it("is a Human") { expect(human).to be_a(Human) }
  it("is a subclass of Player") { expect(human).to be_a(Player) }

  describe '#initialize' do
    it("has a default round_score of 0") { expect(human.round_score).to eq(0) }
    it("has a default game_score of 0") { expect(human.game_score).to eq(0) }
    it("has a different name than Computer's name") { expect(human.name).to_not eq(computer.name) }
  end
end

describe Computer do
  let(:computer) { Computer.new }
  let(:human) { Human.new }

  it("is a Computer") { expect(computer).to be_a(Computer) }
  it("is a subclass of Player") { expect(computer).to be_a(Player) }

  describe '#initialize' do
    it("has a default round_score of 0") { expect(computer.round_score).to eq(0) }
    it("has a default game_score of 0") { expect(computer.game_score).to eq(0) }
    it("has a different name than Human's name") { expect(computer.name).to_not eq(human.name) }
  end

end

