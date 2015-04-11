class StockPicker

  attr_reader :prices

  def initialize(prices)
    @prices = prices
  end

  def check_prices
    @prices.each do |price|
      if !price.is_a?( Integer )
        raise "You passed something that wasn't an int!"
      end
    end
  end

  def determine_best_buy_day
    fixed_days = @prices.reverse.drop(1).reverse
    fixed_days.index(fixed_days.min)
  end

  def determine_best_sell_day
    @prices.index(@prices[determine_best_buy_day..@prices.size].max)
  end

  def best_days
    [determine_best_buy_day, determine_best_sell_day]
  end

end