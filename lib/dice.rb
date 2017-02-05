class Dice

  attr_accessor :sides

  def initialize(n=6)
    @sides = n
  end
  
  def roll_dice
    rand(1..@sides)
  end

end