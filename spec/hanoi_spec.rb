require 'hanoi'

describe TowerOfHanoi do
  let(:tower) { TowerOfHanoi.new(3) }
  describe '#initialize' do
    it 'receives the number of blocks' do
      expect(tower.blocks).to eq(3)
    end
    let(:string_tower) { TowerOfHanoi.new("hello") }
    it 'raises an error if passed a string' do
      expect { string_tower }.to raise_error(ArgumentError)
    end
    let(:float_tower) { TowerOfHanoi.new(2.3) }
    it 'raises an error if past a float' do
      expect { float_tower }.to raise_error(ArgumentError)
    end
    it 'creates the initial game board' do
      expect(tower.board).to eq([3,0,0])
    end
    it 'sets the tower positions to empty arrays' do
      expect(tower.tower_one).to be_a(Array)
      expect(tower.tower_two).to be_a(Array)
      expect(tower.tower_three).to be_a(Array)
    end
  end
  describe '#move_input' do
    it 'is called when the win condition has not been met' do
      allow(tower).to receive(:gets).and_return('1,3')
      tower.stub(:determine_win).and_return(true)
      expect(tower).to receive(:move_input)
      tower.play
    end
    it 'should exit when q is entered' do
      allow(tower).to receive(:gets).and_return('q')
      expect { tower.move_input }.to raise_error
    end
  end
  describe '#input_error_checking' do
    it 'raises an error when more than 2 numbers are passed' do
      expect { tower.input_error_checking(["1", "2", "3"]) }.to raise_error(ArgumentError)
    end
    it 'raises an error when less than 2 numbers are passed' do
      expect { tower.input_error_checking(["1"]) }.to raise_error(ArgumentError)
    end
    it 'raises an error when a 0 is passed' do
      expect { tower.input_error_checking(["1", "0"]) }.to raise_error(ArgumentError)
    end
    it 'raises an error when a non-int is passed' do
      expect { tower.input_error_checking(["1", "z"]) }.to raise_error(ArgumentError)
    end
  end
  describe '#move_error_checking' do
    it 'raises an error when trying to move from empty space' do
      expect { tower.move_error_checking(["2", "3"]) }.to raise_error(ArgumentError)
    end
  end
  describe '#move_block' do
    it 'moves the block' do
      tower.move_block(["1", "3"])
      expect(tower.tower_one).to eq([3, 2])
      expect(tower.tower_three).to eq([1])
    end
  end
end