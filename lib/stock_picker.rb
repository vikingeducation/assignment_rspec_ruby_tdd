class StockKing
  def stock_picker(array)
    raise ArgumentError, 'Argument must be an array which contains integers (at least two) that are larger than 1' unless stocks_are_valid?(array)
    buy_and_sell_indexes = []
    biggest_profit = 0
    array.each_with_index do |stock, index|
      index_of_sell_stock = index + 1
      while index_of_sell_stock < array.count do
        if (array[index_of_sell_stock] - stock) > biggest_profit
          biggest_profit = (array[index_of_sell_stock] - stock)
          buy_and_sell_indexes = [index, index_of_sell_stock]
        end
        index_of_sell_stock += 1
      end
    end
    buy_and_sell_indexes
  end

  def stocks_are_valid?(array)
    return true if (array.is_a? Array) && (stocks_greater_than_zero?(array)) && (stocks_are_integers?(array)) && (array.count >= 2)
    false
  end

  def stocks_greater_than_zero?(array)
    array.each do |stock|
      return false if stock < 1
    end
    true
  end

  def stocks_are_integers?(array)
    array.each do |stock|
      return false if !(stock.is_a? Integer)
    end
    true
  end
end