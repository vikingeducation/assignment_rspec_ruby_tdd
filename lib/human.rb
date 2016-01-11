class Human < Player

  def set_dice(number)
    raise ArgumentError.new("Please enter a number") unless number.to_i.is_a?(Fixnum)
    raise ArgumentError.new("Please enter a positive number") unless number.to_i > 0
    @dice = number.to_i
  end
end