
class Dice
  
  attr_accessor :num_dice

  def initialize
      @num_dice = 0
  end 

  def roll_all_dice
    total = 0
    @num_dice.times do
      total += roll_dice
    end
    total

  end 

  def roll_dice
      num = (1..6).to_a.sample
      num
  end

  def ask_dice_roll
    inp = 0
    until inp.between?(1,10)
      print "Enter number of dice to roll (between 1 .. 10) : "
      inp = gets.chomp.to_i
    end
    @num_dice = inp
  end 
    
end 