class StockPicker
  def stock_picker(stocks)
    best = [0, 1]
    stocks.each_with_index do |stock, oi|
      stocks.each_with_index do |pair, ii|
        next if oi >= ii
        best = [oi, ii] if compare(stocks, [oi, ii]) > compare(stocks, best)
      end
    end
    best
  end
  def compare(stocks, pair)
    stocks[pair[1]] - stocks[pair[0]]
  end
end