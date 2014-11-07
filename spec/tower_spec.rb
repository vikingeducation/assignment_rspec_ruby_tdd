require 'lib/tower'


describe Game do
  #need a board double and a player double, with stubs for 
  it 'accepts a variable number of disks'
  
  describe '#play' do

    
    it 'renders the game status at the beginning of each turn'
    it 'asks player to #take_turn each iteration of the turn loop'
    it 'loops another turn as long as NOT #game_over?'
    
  end
  
  describe '#game_over' do
    it 'returns true if player quits'
    it 'returns true if player has won'
    it 'returns false if player has not quit and has not won'
  end
end

describe Board do

  describe '#towers' do
  
    it 'is an array' do
      expect(subject.towers).to be_a(Array)
    end
    
    it 'starts with a full first tower and two empty towers, each of which are arrays'
      expect(subject.towers).to eq( [ ["ooo","oo","o"], [], [] ] )
    end
    
    it 'accepts a variable number of disks' do 
      let(:four_high){ Board.new(4) }
      expect(four_high.towers).to eq( ( [ ["oooo","ooo","oo","o"], [], [] ] )
    end
    
    it 'only accepts integer numbers of disks' do
      expect(Board.new(3.5)).to raise_error
    end
    
    it 'cannot be modified via setters' do
      expect{subject.towers = [["o"],[],[]]}.to raise_error(NoMethodError)
    end
    
  end
  

  describe '#victory?' do
    it 'is true when the tower is fully assembled on a different peg than the initial one'
      allow(subject).to_receive(:towers).and_return( [ [], [], ["ooo","oo","o"] ] )
      expect(subject.victory?).to equal(true)
    end
  end
  
  describe '#valid_move?' do
    it 'does not allow placing a larger disk onto a smaller disk'
    
    it 'takes an array of two integers'
    
    it 'moves the top disk from the tower indicated by the first integer to the second'
    
    it 'uses ordinals, not cardinals'
  end
  
  describe '#render' do
    
  end
  
end

describe Player do
  describe '#get_move' do
    it 'allows the player to quit at any time by entering "q" '
  end
end
