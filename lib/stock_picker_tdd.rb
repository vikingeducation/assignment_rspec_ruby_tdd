class StockPicker

  def initialize do
  end

  def stock_picker(stock_array)
    max_profit = [0, 0, 0]

    stock_array.each_with_index do |buy_value, buy_index|
      stock_array[buy_index+1...stock_array.length].each_with_index do |sell_value, subarray_index|
        profit = sell_value-buy_value
        if profit > max_profit[0]
          max_profit = [profit, buy_index, buy_index+ 1+subarray_index]
        end
      end  
    end
    puts max_profit
  end
end

stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])






# class StockPicker
#   attr_reader: buy_index

#   def initialize
#     @buy_index = 0
#     @sell_index = 0
#     @max_profit = [0]
#     @stock_array = []
#   end

#   def picker(array)
#     until @buy_index == @stock_array.length-1
#       sell_index = stock_array.length -1
#       until buy_index == sell_index
#       profit (sell_index, buy_index)
#       if profit > max_profit
#         profit = max_profit[0]
#           max_profit= [profit, buy_index, sell_index]
#       end
#       sell_index -= 1
#     end
#     buy_index += 1
#   end
#   return [max_profit[1], max_profit[2]]
# end

# def profit
#   @stock_array[sell_index]-@stock_array[buy_index]
# end