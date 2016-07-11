class Examples

  def stock_picker(arr)
    raise ArgumentError unless arr.class == Array && arr.all? { |item| item.class == Fixnum } && arr.length >= 2
    max = 0
    result = []
    arr.each_with_index do |day_one, index|
      arr.each_with_index do |day_two, index|
        max = day_two - day_one if day_two - day_one > max
      end
    end
  end
end
