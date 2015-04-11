require 'anagrams'

describe Anagrams do
  before(:each) { allow(File).to receive(:open).and_return(["RETOOL", "ROOTLE", "TOOLER", "NICEMEME"])}
  let(:anagrams) { Anagrams.new("looter") }
  describe '#initialize' do
    it 'gets the word' do
      expect(anagrams.word).to eq("looter")
    end
    let(:bad_anagrams) { Anagrams.new(1) }
    it 'raises an ArgumentError for non-string input' do
      expect { bad_anagrams }.to raise_error(ArgumentError)
    end
  end
  describe '#find_anagrams' do
    it 'opens the file' do
      expect(File).to receive(:open)
      anagrams.find_anagrams
    end
    it 'returns an array' do
      expect(anagrams.find_anagrams).to be_a(Array)
    end
    let(:no_anagrams) { Anagrams.new("zebra") }
    it 'returns a blank array if no valid anagrams' do
      expect(no_anagrams.find_anagrams).to eq([])
    end
    it 'returns an array with valid anagrams' do
      expect(anagrams.find_anagrams).to include("RETOOL", "ROOTLE", "TOOLER")
    end
  end
end