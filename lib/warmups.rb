require 'pry'

class Warmups

  def stock_picker(prices)
    validate_stock_input(prices)
    buy_date = 0
    sell_date = 1
    max_profit = 0

    prices.each do |buy_price| 
      remaining_prices(prices, buy_price).each do |sell_price|       
        if (prices.find_index(buy_price) == 0) && (prices.find_index(sell_price) == 1)
          max_profit = sell_price - buy_price
        elsif sell_price - buy_price > max_profit
          buy_date = prices.find_index(buy_price)
          sell_date = prices.find_index(sell_price)
          max_profit = sell_price - buy_price
        end
      end
    end

    [buy_date, sell_date]

  end

  def remaining_prices(prices, buy_price)
    prices[(prices.find_index(buy_price)+1)..-1]
  end

  def validate_stock_input(prices)
    raise "Your input should be an array" unless prices.is_a? Array
    raise "Make sure all prices are numbers" unless prices.all? { |price| price.is_a? Numeric }
    raise "You need at least two prices" unless prices.length > 1
    raise "All prices must be positive" unless prices.all? { |price| price > 0 }
  end

end

warmup = Warmups.new
warmup.stock_picker([12,2,1])