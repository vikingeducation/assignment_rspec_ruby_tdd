class Human < Player

  def set_dice
    puts "Instructions:"
    puts "Enter how many dice you'd like to throw"
    puts "If your total is higher than the computer, you win!"

    dice = gets.chomp

    raise TypeError.new("Please enter a number") unless dice.to_i.to_s == dice
    raise ArgumentError.new("Please enter a positive number") unless dice.to_i > 0
    @dice = dice.to_i
  end
end