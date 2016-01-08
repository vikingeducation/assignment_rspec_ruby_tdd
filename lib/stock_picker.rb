def stock_picker(array)
  raise "Invalid argument" if !array.is_a?(Array)
  raise "Invalid input" if array.any? { |element| !element.is_a?(Fixnum) }
end
