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
      die = Dice.new
      single_roll = die.single_roll
      @round_total += single_roll
    end
    return @round_total
  end
end
