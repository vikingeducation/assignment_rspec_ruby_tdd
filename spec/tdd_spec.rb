require './lib/tdd'


describe TestDrivenDevelopment do
  
  let(:tdd){TestDrivenDevelopment.new}
  
  describe '#stock_picker' do  

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

  describe '#anagrams' do

    before(:each) do

      allow(File).to receive(:readlines).and_return(["retool",
       "rootle", "tooler", "elbow"])
      
    end

    it 'returns an array' do
      # dub_dict = double(:readlines => "looter")
      
      expect(tdd.anagrams("looter")).to be_a(Array)
    end

    it 'returns a correct array if string is "looter"' do
      expect(tdd.anagrams("looter")).to eq(["retool",
       "rootle", "tooler"])

    end

    it 'returns an empty array if no anagrams found' do
      expect(tdd.anagrams("zygote")).to be_empty
    end

    it 'returns correct array if string has uppercase' do
      expect(tdd.anagrams("LooTer")).to eq(["retool",
       "rootle", "tooler"])
    end

    it 'returns correct array if string has whitespace/newlines' do
      expect(tdd.anagrams("    LooTer \n")).to eq(["retool",
       "rootle", "tooler"])
    end


  end



end


  














