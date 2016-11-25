require 'anagrams'

describe Anagrams do
  let(:gram) {Anagrams.new}
  describe '#anagrams' do

    it 'raises an error if no arguments are entered' do
      expect{gram.anagrams}.to raise_error(ArgumentError)
    end

    it 'checks a basic dictionary and basic word' do
      expect(gram.anagrams('looter', ['spooky', 'retool', 'rootle', 'tooler', 'toddler']))
      .to eq(['retool', 'rootle', 'tooler'])
    end
  end
end
