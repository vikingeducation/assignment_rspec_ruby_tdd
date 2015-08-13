def stock_picker(array)
  raise("input is not an array") unless array.is_a?(Array)
  raise("input is too small") unless array.length > 2
  raise("input must contain only integers") unless array.all? { |element| element.is_a?(Integer) }

  profit = 0
  final = []

  array.each_with_index do |price, buy_day|
    buy_day.upto(array.length - 1) do |sell_day|

      if array[sell_day] > price
        current_profit = array[sell_day] - price

        if current_profit > profit
          profit = current_profit
          final = [buy_day, sell_day]
        end

      end

    end
  end

  final

end