require_relative 'dice'
class Player
  attr_accessor :round_total, :running_total
  def initialize
    @round_total = 0
    @running_total = 0
  end

  def turn(number)
    @round_total = 0
    number.times do
      @round_total += Dice.single_roll
    end
    @running_total += @round_total
    return @round_total
  end
end
