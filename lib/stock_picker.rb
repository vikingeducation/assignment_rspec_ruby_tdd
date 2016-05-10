def stock_picker(prices)
  raise ArgumentError if prices.length < 2
  raise ArgumentError if prices.any? { |value| value.is_a?(String)}

  buy_day, sell_day = nil, nil

  max_return = 0

  prices.each_with_index do |price_a, day_a|
    prices.each_with_index do |price_b, day_b|
      current_return = price_b - price_a

      if day_b > day_a && current_return > max_return
        max_return = current_return
        buy_day, sell_day = day_a, day_b
      end

    end
  end
  [buy_day, sell_day]
end
