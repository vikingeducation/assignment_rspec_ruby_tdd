
def stock_picker(prices=[0,0])
  if prices == [0,0]
    puts "Enter your prices:" # 43,24,565
    prices = gets.chomp.split(",")
  end

  if prices.length < 2
    raise ArgumentError
  elsif(prices.class != Array)
    raise ArgumentError
  end

  buy_day = 0
  sell_day = 0
  difference = 0
  prices.each_with_index do |price, index|
    count = index + 1
    while count < prices.length
      if price[index]-price[count] > difference
        buy_day = index
        sell_day = count
        difference = price[index]-price[count]
      end
      count += 1
    end
  end
  difference > 0 ? [buy_day + 1 , sell_day + 1] : "Sorry!"
end