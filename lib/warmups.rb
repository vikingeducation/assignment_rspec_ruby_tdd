def stock_picker(input)
  raise ArgumentError unless input.is_a?(Array) && input.length > 1
  raise ArgumentError unless input.all? { |item| item.is_a?(Fixnum) }
  buy_day, sell_day = [nil, nil]
  input.each_with_index do |price, day|

  end

end
raise "There are no profits to be made here"
