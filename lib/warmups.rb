module Warmups

def self.stock_picker(stocks)
  result = {buy: nil, sell: nil, profit: nil}
  (0...stocks.length).reduce(result) do |result, buy_day|
    (buy_day...stocks.length).reduce(result) do |partial, sell_day|
      bd, sd = stocks[buy_day], stocks[sell_day]
      if partial[:profit].nil?
        {buy: buy_day, sell: sell_day, profit: sd - bd}
      else
        new_profit = sd - bd
        if new_profit > partial[:profit]
          {buy: buy_day, sell: sell_day, profit: new_profit}
        else
          partial
        end
      end
    end
  end
end

def self.anagrams(string, words)
  words.reduce([]) do |result, word|
    if word.chars.sort.join == string.chars.sort.join
      result << word.upcase
    else
      result
    end
  end
end

end
