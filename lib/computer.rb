class Computer

  def roll(dice_num) 
    dice_roll = rand(dice_num..dice_num * 6)
    puts "Computer's roll is #{dice_roll}"
    dice_roll
  end

end
