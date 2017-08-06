RSpec.describe '#stock_picker' do
    #   Write a method stock_picker which takes an array of stock prices (prices on days 0, 1, ...)
    #   and outputs the most profitable pair of days on which to first buy the stock and then sell the stock,
    #   for example:
    #
    # > stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
    # #=> [2, 6]
    # You'll need to make sure you think about potential edge cases ahead of time,
    # then write tests which slowly build up the code to solve them.
    # There are quite a few in there which trip people up when they solve this problem.
  context 'stock value increases (happy)' do
    it 'returns the day to buy the stock and the day to sell it.' do
      examples = [[[44, 30, 24, 32, 35, 30, 40, 38, 15], [2, 6]],
                  [[7, 59, 154, 59, 170, 76, 142, 5, 72, 33], [0, 4]],
                  [[101, 63, 38, 120, 15, 128, 197, 48, 107, 107], [4, 6]],
                  [[22, 185, 10, 187, 81, 19, 143, 26, 178, 62], [2, 3]],
                  [[134, 164, 103, 23, 38, 185, 98, 96, 113, 164], [3, 5]],
                  [[68, 195, 26, 138, 145, 74, 176, 81, 185, 20], [2, 8]],
                  [[20, 25, 18, 14, 10, 9], [0, 1]]]

      examples.each do |days, result|
        expect(stock_picker(days)).to eq(result)
      end
    end
  end

  context 'stock value decreases (sad)' do
    it 'returns nil' do
      days = [20, 18 ,14]

      expect(stock_picker(days)).to be_nil
    end
  end

  context 'bad input (bad)' do
    it 'raises an exception if not array' do
      expect { stock_picker(double) }.to raise_error(StandardError)
    end

    it 'returns nil when only 1 day given' do
      expect(stock_picker([20])).to be_nil
    end
  end


end
