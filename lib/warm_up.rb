#
# > stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
# #=> [2, 6]
def stock_picker(stocks)
	raise "You are suck, use array!" unless stocks.is_a? Array
	raise "You are a sock, use numbers!" unless stocks.all? {|num|num.is_a? Numeric}

  buy = 0
  sell = 0
  difference = 0

  stocks.each_with_index do |first_number, first_index|
    first_index.upto(stocks.size - 1 ) do |second_index|
      second_number = stocks[second_index]

      if second_number - first_number > difference
        difference = second_number - first_number
        buy, sell = first_index, second_index
      end

    end
  end

  [buy, sell]


end