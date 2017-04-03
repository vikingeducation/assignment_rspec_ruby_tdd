require 'anagrams'

describe Anagram do

  describe '#input checks' do
    it 'checks if the input is a string' do
      dictionary = double('Dictionary', include?: ['zygote'])
      expect { subject.anagram_finder(1, dictionary) }.to raise_error(ArgumentError, 'Must enter a string')
      expect { subject.anagram_finder([2, 4, 'Life'], dictionary) }.to raise_error(ArgumentError, 'Must enter a string')
    end
  end

  describe 'finding anagrams' do
    it 'should find anagrams of a word in provided dictionary' do
      expect(subject.anagram_finder('looter', %w(spooky retool rootle tooler toddler))).to include('RETOOL', 'ROOTLE', 'TOOLER')
    end

    it 'returns an empty array for a word with no anagrams' do
      dictionary = ["zygote"]

      expect(subject.anagram_finder('zygote', dictionary)).to eq([])
    end

    it 'returns the anagrams from a word with anagrams as an array' do
      dictionary = ["APERS","APRES","ASPER","PARES","PARSE","PRASE","PRESA","RAPES","REAPS","SPARE","B", "SPR", "SPEA","SPEAR", "ZYGOTE"]

      expect(subject.anagram_finder('PEARS', dictionary)).to eq(["APERS","APRES","ASPER","PARES","PARSE","PRASE","PRESA","RAPES","REAPS","SPARE","SPEAR"])
    end
  end

  describe "using dictionary" do
    it "should use text dictionary as a default" do
      allow(subject).to receive(:open_dictionary).and_return(["APERS","APRES","ASPER","PARES","PARSE","PRASE","PRESA","RAPES","REAPS","SPARE","B", "SPR", "SPEA","SPEAR", "ZYGOTE"])
      expect(subject).to receive(:open_dictionary)
      expect(subject.anagram_finder('PEARS')).to be_a(Array)
    end
  end
end
