def stock_picker(prices)
  raise "nope" unless prices.is_a?(Array)
  raise "nope" unless prices.size > 1
  raise "nope" if prices.sort { |a, b| b <=> a } == prices
end
