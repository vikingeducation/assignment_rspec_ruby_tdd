require 'anagram'

RSpec.describe '#anagrams' do
  context 'when there are matches' do
    it 'returns matches in upcase' do
      dictionary = %w(spooky retool rootle tooler toddler)
      word = "looter"

      expect(anagrams(word, dictionary)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end
  end

  context 'when there are no matches' do
    it 'returns an empty array' do
      dictionary = %w(spooky retool rootle tooler toddler)
      word = "zygote"

      expect(anagrams(word, dictionary)).to be_a Array
      expect(anagrams(word, dictionary)).to be_empty
    end
  end
end
