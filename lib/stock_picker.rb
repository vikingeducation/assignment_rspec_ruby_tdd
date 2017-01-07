def stock_picker(prices)
  raise ArgumentError unless prices.is_a?(Array)
  return [prices.index(prices.min), prices.index(prices.max)] if prices.index(prices.max) - prices.index(prices.min) > 0
  winners = {buy: 0, sell: 0, diff: 0}
  prices.each_with_index do |price, i|
    (i...prices.size).each do |j|
      if prices[j] - price > winners[:diff] && prices[j] - price > 0
        winners[:diff] = prices[j] - price
        winners[:buy] = i
        winners[:sell] = j
      end
    end
  end
  [winners[:buy], winners[:sell]]
end
