class StockPicker

  def pick(array)
    raise "Array not passed" if not array.is_a? Array
    raise "Array elements should be numeric and positive" if not array.all? {|item| item.is_a? Numeric}
    raise "Array elements should be numeric and positive" if not array.all? {|item| item >= 0}
  end

end