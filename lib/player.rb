# All actions related to the Player
require_relative 'dice'

class Player
  attr_accessor :num_dice, :total, :dice, :wins

  def initialize
    @total = 0
    @dice = Dice.new(6)
    @wins = 0
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


