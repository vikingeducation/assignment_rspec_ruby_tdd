require './lib/tdd'


describe TestDrivenDevelopment do
  describe '#stock_picker' do
    let(:tdd){TestDrivenDevelopment.new}

    it 'returns an array of numbers' do

        expect(tdd.stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to be_a(Array)
    end

    it 'returns the biggest profit'  do

       expect(tdd.stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
    end

    it 'returns empty if 1 value entered' do 

      expect(tdd.stock_picker([44])).to be_empty
    end
  
    it 'returns empty if no profits gained' do
      expect(tdd.stock_picker([44,22])).to be_empty
    end

      
    it 'returns empty if array has all equal numbers' do
      expect(tdd.stock_picker([5,5,5,5,5,5,5])).to be_empty
    end
  end
end