class Player

  attr_reader :dice_number

  def initialize
    @dice_number = 0
  end

  def ask_dice_number
    puts "How many dice would you like to play with?"
    @dice_number = gets.chomp.to_i
  end

  def valid?
    @dice_number > 0 
  end

  def roll
    dice_roll = rand(@dice_number..(@dice_number * 6))
    puts "You rolled a #{dice_roll}"
    dice_roll
  end
end
