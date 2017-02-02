# All actions related to the Player
require 'dice'

class Player
  attr_accessor :num_dice, :total, :dice

  def initialize
    @total = 0
    @dice = Dice.new(6)
  end

  def no_of_dice(n)
    @num_dice = n
  end

  def roll(num_dice)
    num_dice.times do
      @total += dice.roll_dice
    end
  end 
end


