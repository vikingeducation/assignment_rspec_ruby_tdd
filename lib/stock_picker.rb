class StockPicker
  attr_reader :daily_prices

  def initialize(daily_prices)
    if daily_prices.all? { |price| price.class == Fixnum }
      @daily_prices = daily_prices
    else
      raise 'All prices must be integers'
    end
  end

  def best_dates
    greatest_profit = 0

    buy_date = 0
    while buy_date < (daily_prices.length - 1)
      sell_date = buy_date + 1
      while sell_date < daily_prices.length
        profit = daily_prices[sell_date] - daily_prices[buy_date]
        if profit > greatest_profit
          best_buy_date = buy_date
          best_sell_date = sell_date
          greatest_profit = profit
        end
        sell_date += 1
      end
      buy_date += 1
    end

    if best_buy_date.nil? && best_sell_date.nil?
      raise 'Prices declined every day!'
    else
      [best_buy_date,best_sell_date]
    end
  end
end