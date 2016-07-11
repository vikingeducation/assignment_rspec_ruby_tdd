class Examples

  def stock_picker(arr)
    raise ArgumentError unless arr.class == Array && arr.all? { |item| item.class == Fixnum } && arr.length >= 2
    max = 0
    result = [0,0]
    arr.each_with_index do |day_one, index1|
      arr.each_with_index do |day_two, index2|
        if index2 > index1 && day_two - day_one > max
            max = day_two - day_one
            result[0], result[1] = index1, index2
        end
      end
    end
    return result unless result==[0,0]
    puts "bad time to trade"
  end

  def anagrams(str, array)
    p str
    p array
    raise ArgumentError unless str.is_a?(String) && array.is_a?(Array)
    array.select{ |word| word.chars.sort == string.chars.sort }
  end
end
