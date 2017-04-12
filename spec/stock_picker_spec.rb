RSpec.describe '#stock_picker' do

  def stock_picker(prices)
    buy_day = lowest_price_index(prices)
    sell_day = highest_price_index(prices)

    if (prices.size > 1) && (buy_day < sell_day)
      [buy_day, sell_day]
    else
      []
    end
  end

  def lowest_price_index(prices)
    lowest_price = prices.sort.first
    prices.find_index lowest_price
  end

  def highest_price_index(prices)
    highest_price = prices.sort.last
    prices.find_index highest_price
  end
  context 'passed empty array' do
    it 'returns empty array' do
      expect(stock_picker([])).to eq []
    end
  end

  context 'passed array with single price' do
    it 'returns empty array' do
      expect(stock_picker([1])).to eq []
    end
  end

  context 'passed only two prices' do
    context 'low price before high price' do
      it 'returns passed in array' do
        expect(stock_picker([3, 9])).to eq [0, 1]
      end
    end

    context 'high price is before low' do
      it 'returns empty array' do
        expect(stock_picker([9, 3])).to eq []
      end
    end
  end
  context 'at least 3 prices' do
    it 'returns index of buy and sell' do
      expect(stock_picker([3, 6, 9])).to eq [0, 2]
    end
  end
end

describe 'anagrams' do
  def anagrams(word, list)
    sorted_word = word.chars.sort.join('')
    if list.any?
      list.select{ |word| word.chars.sort.join('') == sorted_word}
    else
      []
    end
  end

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