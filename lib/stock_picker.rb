def stock_picker(stocks)
  raise ArgumentError.new("Input must be an array") unless stocks.is_a?(Array)
  raise ArgumentError.new("Entries must be numbers") unless stocks.all? { |price| price.is_a?(Fixnum) }
  raise ArgumentError.new("Not enough days given") unless stocks.length >= 2

  profit = 0
  profit_days = [0, 1]

  stocks.each_with_index do |price1, day1|
    future_stocks = stocks[day1..-1]
    future_stocks.each_with_index do |price2, day2|
      if price2 - price1 > profit
        profit_days = [day1, day1 + day2]
        profit = price2 - price1
      end
    end
  end

  return nil if profit == 0
  profit_days
end