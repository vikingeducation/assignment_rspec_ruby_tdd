#
# > stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
# #=> [2, 6]
def stock_picker(stocks)
	raise "You are suck, use array!" unless stocks.is_a? Array
	raise "You are a sock, use numbers!" unless stocks.all? {|num|num.is_a? Numeric}
end