class Warmups

  def stock_picker(stock_prices)

    #puts "Welcome to the stock picker"

    raise "Only accepts days in an array" unless stock_prices.is_a?(Array)

    most_profit = 0

    result = [0,0]

    (0..(stock_prices.length-1)).each do |begin_day|

      ((begin_day+1)..(stock_prices.length-1)).each do |end_day|

        difference = stock_prices[end_day] - stock_prices[begin_day]

        if difference > most_profit

          most_profit = difference
          result[0] = begin_day
          result[1] = end_day

        end

      end

    end

    puts "Sorry, no profit in these days :(" if most_profit == 0

    result

  end


end

