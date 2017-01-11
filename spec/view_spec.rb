require 'view'

describe View do
  before do
    allow(STDOUT).to receive(:puts).and_return(nil)
    allow(STDOUT).to receive(:print).and_return(nil)
  end
  describe '#initialize' do

    it 'should be a View' do
      expect(subject).to be_a(View)
    end

  end

  describe '#print_throws' do
    let(:human){ instance_double(Player, :name => 'Moss', :wins => 5, :dice_throw => 4)}
    let(:ai){ instance_double(Player, :name => 'Roy', :wins => 0, :dice_throw => 5)}
    it 'expects two arguments' do
      expect{ subject.print_throws }.to raise_error(ArgumentError)
    end
    it 'asks for player scores' do
      allow(human).to receive(:dice_throw)
      expect(human).to receive(:dice_throw)
      subject.print_throws(human, ai)
    end
    it 'prints draw message' do
      allow(human).to receive(:dice_throw).and_return(4)
      allow(ai).to receive(:dice_throw).and_return(4)
      expect{subject.print_throws(human, ai)}.to output(/.*draw.*/).to_stdout
    end
  end

  describe '#output' do

    it 'only accepts strings' do

      expect{ subject.output }.to raise_error(ArgumentError)
    end

    it 'should output something' do
      expect(subject).to receive(:puts)
      subject.output('hello, world!')
    end

  end

  describe 'print_score(human, computer)' do
    let(:human){ instance_double(Player, :name => 'Moss', :wins => 5)}
    let(:ai){ instance_double(Player, :name => 'Roy', :wins => 0)}

    it 'should output something' do
      expect(subject).to receive(:puts).at_least(1).times
      subject.print_score(human, ai)
    end

    it 'calls human and ai\'s wins method' do
      expect(human).to receive(:wins)
      expect(ai).to receive(:wins)
      subject.print_score(human, ai)

    end

    it 'calls human and ai\'s name method' do
      expect(human).to receive(:name)
      expect(ai).to receive(:name)
      subject.print_score(human, ai)
    end

  end

end
