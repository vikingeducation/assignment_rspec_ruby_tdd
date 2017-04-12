def anagrams(word, list)
  sorted_word = word.chars.sort.join('')
  if list.any?
    list.select{ |word| word.chars.sort.join('') == sorted_word}
  else
    []
  end
end

describe 'anagrams' do
  describe 'given a word and a list of potential anagrams' do
    context 'word is in the list' do
      it 'returns the word' do
        word = 'looter'
        list = %w(looter)
        expect(anagrams(word, list)).to eq [word]
      end
    end

    context 'no anagrams in the list' do
      it 'returns an empty list' do
        word = 'looter'
        list = %w(cat dog)
        expect(anagrams(word, list)).to eq []
      end
    end

    context 'anagrams in list' do
      it 'returns the only the anagrams' do
        word = 'looter'
        list =  %w(spooky retool rootle tooler toddler)
        expect(anagrams(word, list)).to match %w(retool rootle tooler)
        expect(anagrams(word, list)).not_to match %w(spooky toddler)
      end
    end
  end
end