class Examples

  def stock_picker(arr)
    raise ArgumentError unless arr.class == Array && arr.all? { |item| item.class == Fixnum } && arr.length >= 2
    max = 0
    arr.each_with_index do |day_one, index|
      arr.each_with_index do |day_two, index|
      end
    end
  end
end
