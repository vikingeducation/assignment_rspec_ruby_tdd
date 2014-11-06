def stock_pick(array)
  raise ArgumentError, "illegal input" unless array.is_a?(Array)
  raise ArgumentError, "non-numeric input" unless array.all? { |entry| entry.is_a?(Integer) }
  raise ArgumentError, "negative or zero input" unless array.all? {|entry| entry > 0}
  []
end