# warmup.rb
class Warmup

  def stock_picker(price_array)
    raise "Two or more days of prices required" if price_array.length < 2
    raise "Input needs to be an Array" unless price_array.is_a?(Array)
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


  def anagrams(string)
    raise "Input must be a string" unless string.is_a?(String)
    raise "Input must be a single word (no spaces)" if string.include?(" ")

    #dictionary = IO.readlines("lib/enable.txt")
    dictionary = ["star","pots","bread","tars","stop","meat"]
    dictionary.select { |word| word.chars.sort.join == string.downcase.chars.sort.join }
  end

end