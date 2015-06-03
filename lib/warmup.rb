# warmup.rb
class Warmup

  def stock_picker(price_array)
    raise "Two or more days of prices required" if price_array.length < 2
    raise "Input needs to be an Array" if !price_array.is_a?(Array)
    raise "No profitable buy/sell option" if price_array.sort.reverse == price_array

    output = Hash.new

    0.upto(price_array.size - 1) do |buy_day|
      sell_price = price_array.drop(1 + buy_day).max.to_i
      sell_day = price_array.index(sell_price)

      buy_price = price_array[buy_day]

      output[[buy_day, sell_day]] = (sell_price - buy_price)
    end

    output.key(output.values.max)
  end

end