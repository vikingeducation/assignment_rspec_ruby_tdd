def stock_picker(array)
  raise ArgumentError "Invalid argument" if !array.is_a?(Array)
  raise ArgumentError "Invalid input" if array.any? { |element| !element.is_a?(Fixnum) }


  return array
end
