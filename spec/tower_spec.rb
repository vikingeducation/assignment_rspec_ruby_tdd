require 'tower'
require 'pry'


describe Game do
  #need a board double and a player double, with stubs for 

  describe '#initialize' do


    it 'creates a Board of specified size' do
      expect(Board).to receive(:new).with(5)
      Game.new(5)
    end

  end

  describe '#play' do
    let(:board){ double(:render => nil, :victory? => true) }
    let(:player){ double(:quitting? => true, :take_turn => nil) }

    before do
      allow(Player).to receive(:new).and_return(player)
      allow(Board).to receive(:new).and_return(board)
    end

    it 'renders the game status at the beginning of each turn' do
      expect(board).to receive(:render)
      subject.play
    end

    it 'asks player to #take_turn each iteration of the turn loop' do
      expect(player).to receive(:take_turn)
      subject.play
    end

    it 'thanks the player if the game is over' do
      allow(subject).to receive(:game_over?).and_return(true)
      expect{subject.play}.to output(/[Tt]hank.+ for playing/).to_stdout
    end

    it 'celebrates your victory' do
      allow(subject).to receive(:game_over?).and_return(true)
      expect{subject.play}.to output(/[Yy]ou won/).to_stdout
    end

    it 'skips the victory message if you quit' do
      allow(subject).to receive(:game_over?).and_return(true)
      allow(board).to receive(:victory?).and_return(false)
      expect{subject.play}.not_to output(/[Yy]ou won/).to_stdout
    end
  end
end

describe Board do

  describe '#towers' do

    it 'is an array' do
      expect(subject.towers).to be_a(Array)
    end

    it 'starts with a full first tower and two empty towers, all arrays' do
      expect(subject.towers).to eq( [ ["ooo","oo","o"], [], [] ] )
    end

    it 'accepts a variable number of disks' do
      expect(Board.new(4).towers).to eq( [ ["oooo","ooo","oo","o"], [], [] ] )
    end

    it 'only accepts integer numbers of disks' do
      expect{Board.new(3.5)}.to raise_error
    end

    it 'cannot be modified via setters' do
      expect{subject.towers = [["o"],[],[]]}.to raise_error(NoMethodError)
    end

  end


  describe '#victory?' do
    it 'is true when the tower is fully assembled on a different peg than the initial one' do
      allow(subject).to receive(:towers).and_return( [ [], [], ["ooo","oo","o"] ] )
      expect(subject.victory?).to equal(true)
    end
  end

  describe '#make_move' do
    it 'takes an array of two integers' do
      expect{subject.make_move([1,2])}.not_to raise_error
    end

    it 'returns false unless given an array of two integers' do
      expect(subject.make_move(["q"])).to equal(false)
    end

    it 'uses ordinals, not cardinals' do
      expect(subject.make_move([0,1])).to equal(false)
    end

    it 'does not allow placing a larger disk onto a smaller disk' do
      allow(subject).to receive(:towers).and_return([ ["oo", "o"],["ooo"],[] ])
      expect(subject.make_move([2, 1])).to equal(false)
    end

    it 'moves the disk if a move is valid' do
      subject.make_move([1,2])
      expect(subject.towers).to eq([ ["ooo","oo"],["o"], [] ])
    end

    it 'does not make the move if move is invalid' do
      subject.make_move([1,2])
      subject.make_move([1,2])
      expect(subject.towers).to eq([ ["ooo","oo"],["o"], [] ])
    end

  end

  describe '#render' do
    it 'renders the board' do
      expect{subject.render}.to output(/o\s+oo\s+ooo/).to_stdout
    end
  end

end

describe Player do
  let(:board){instance_double("Board")}
  let(:subject){Player.new(board)}

  before do
    allow(board).to receive(:make_move).with(["q"]).and_return(:false)
  end

  describe '#take_turn' do
    before do
      allow(board).to receive(:make_move).with(anything)
    end

    it 'gets a move from the player' do
      allow(board).to receive(:make_move).with([1,3]).and_return(:true)
      allow(subject).to receive(:gets).and_return("1,3")
      expect(subject).to receive(:gets)
      subject.take_turn
    end

    it 'allows the player to quit by entering "q" ' do
      allow(subject).to receive(:gets).and_return("q\n")
      subject.take_turn
      expect(subject.quitting?).to equal(true)
    end
  end
end
