class Player

  attr_accessor :dice, :score

  def initialize(dice=nil)
    @dice = dice
    @score = 0
  end

  def dice=(new_quantity)
    @dice = dice
  end


  def random_die
    roll = rand(1..6)
    puts "#{roll}"
    return roll
  end


end