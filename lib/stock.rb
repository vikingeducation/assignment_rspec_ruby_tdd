def stock(price_array)
  raise "Oops, need an array" unless price_array.is_a? Array
  raise "Oops, need more days" unless price_array.size >= 2

  if price_array.size == 2
    [0, 1]
  else
    best_buy_day = 0
    best_sell_day = 1
    max_return = 0

    # Loop through buy days
    price_array.each_with_index do |buy_price, buy_index|

      # Loop through remaining sell days
      price_array[(buy_index+1)..(price_array.length)].each_with_index do |sell_price, net_sell_index|

        # Reset best data if surpassed
        if sell_price - buy_price > max_return
          best_buy_day = buy_index
          best_sell_day = net_sell_index + buy_index + 1
          max_return = sell_price - buy_price
        end
      end
    end

    [best_buy_day, best_sell_day]
  end
end