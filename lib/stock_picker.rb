def stock_picker(prices)
  raise ArgumentError unless prices.is_a?(Array)
  raise "You have not provided enough price data!" if prices.size <= 1

  differences = {}

  prices.each_with_index do |x, i|
    prices.each_with_index do |y, j|
      differences[[i, j]] = y - x if j > i
    end
  end

  raise "There is no chance of profitability." if differences.values.all? {|i| i < 0 }

  #finds index of value w/ max difference
  index_of_max = differences.values.index(differences.values.max)

  #finds key corresponding to above value
  differences.keys[index_of_max].to_a
end

stock_picker([2, 23, 24, 32, 14, 1000, 41, 6])