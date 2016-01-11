class Dice

  def initialize
    @faces = (1..6).to_a
  end

  def roll
    return @faces.sample
  end

  def self.roll_multiple(number)
    raise ArgumentError, "Not an integer!" if !number.is_a?(Fixnum)
    raise ArgumentError, "Must be positive!" if number <= 0
    dice = Dice.new
    sum = 0
    number.times do
      sum += dice.roll
    end
    return sum
  end
end
