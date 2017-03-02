class Warmup
  def stock_picker(prices)
    raise "The input must be an array." unless prices.is_a?(Array)

    raise "The input should only contain numbers." unless prices.all? { |price| price.is_a?(Numeric) }

    return [] if prices.empty? || prices.size < 2

    best_day_to_buy, best_day_to_sell = nil
    max_profit = 0
    (0..prices.size - 2).each do |buy_day|
      (buy_day + 1..prices.size - 1).each do |sell_day|
        if prices[sell_day] - prices[buy_day] > max_profit
          max_profit = prices[sell_day] - prices[buy_day]
          best_day_to_buy = buy_day
          best_day_to_sell = sell_day
        end
      end
    end

    max_profit == 0 ? [] : [best_day_to_buy, best_day_to_sell]
  end

  def anagrams(string, words)
    return [] if string.empty? || words.empty?
  end
end
