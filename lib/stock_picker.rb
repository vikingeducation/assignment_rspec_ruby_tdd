# stock_picker.rb

class StockPicker

  attr_reader :prices, :buy_day, :sell_day, :highest_profit

  def initialize(prices=[])
    @prices = prices
    @buy_day = 0
    @sell_day = 0
    @profit = 0
    @highest_profit = 0
  end
  
  def stock_picker
    validate_prices
    calculate_profit
    print_results
  end

  def validate_prices
    raise "No prices supplied!" if @prices.empty?
    raise "Price for only one day supplied -- need at least for two days!" if @prices.length == 1
  end

  def calculate_profit
    puts "prices: #{@prices}"
    i = 0
    j = 0
    while i < (@prices.length - 1)
      j = i + 1
      while j < @prices.length
        @profit = @prices[j] - @prices[i]
        if @highest_profit < @profit
          @highest_profit = @profit
          @buy_day = i + 1
          @sell_day = j + 1
        end
        j = j + 1
      end
      i = i + 1
    end
  end

  def print_results
    if @highest_profit == 0
      puts "No profit achieved"
    else
      puts "Highest profit = #{@highest_profit}"
      puts "Purchase on Day #{@buy_day}"
      puts "Sale on Day #{@sell_day}"
      puts
    end
  end

end



# stockpicker = StockPicker.new([35, 25, 30, 43, 55, 35])
# stockpicker.stock_picker

# stockpicker = StockPicker.new([35, 25, 30, 43, 35, 55])
# stockpicker.stock_picker

# stockpicker = StockPicker.new([35, 25, 15])
# stockpicker.stock_picker




