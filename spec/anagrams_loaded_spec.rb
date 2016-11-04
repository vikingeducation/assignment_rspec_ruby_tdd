require 'AnagramsLoaded'

describe AnagramsLoaded do

  describe '#anagrams' do
  	let(:dictionary){ %w(spooky retool rootle tooler toddler) }
    let(:file_double){double(open: true, read: %w(spooky retool rootle tooler toddler), close: true)}

    it 'raises an error if not given parameters' do
    	expect{ anagrams }.to raise_error(ArgumentError)
    end

    it 'raises an error if not given a string word' do
    	expect{ anagrams(1) }.to raise_error(ArgumentError)
    end

    xit 'does not return the original word you sent it' do
      expect(anagrams("something")).not_to include("something")
    end

    xit 'only will only find anagrams for a single word' do
      expect{ anagrams("two words") }.to raise_error("Please enter one word only")
    end

    xit 'returns a list of matching anagrams' do
      expect(anagrams("looter")).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end

    xit 'returns an empty list if no anagrams are found' do
      expect(anagrams("zygote")).to eq([])
    end

    it 'calls file.open' do
      expect()
    end

    it 'raises an error if it cannot load the dictionary' do

    end

    it 'sets dictionary to an list of words when file is opened' do

    end

  end
end
