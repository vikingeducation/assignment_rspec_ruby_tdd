def stock_picker(prices)
  raise "nope" unless prices.size > 1
  raise "nope" if prices.sort { |a, b| b <=> a } == prices

  if prices[0] == prices.min
    return [0, prices.index(prices.max)]
  else
    max_diff = 0
    best_days = [nil, nil]
    1.upto(prices.size - 2) do |beg_index|
      beg_index.upto(prices.size - 1) do |end_index|
        if prices[end_index] - prices[beg_index] > max_diff
          max_diff = prices[end_index] - prices[beg_index]
          best_days = [beg_index, end_index]
        end
      end
    end
        
  end
  best_days
end
