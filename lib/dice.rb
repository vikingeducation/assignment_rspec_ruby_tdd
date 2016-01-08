class Dice
  def roll(number_of_dice)
    puts
    total = 0
    number_of_dice.times do
      die = (1..6).to_a.sample
      sleep 0.1
      print " #{die} "
      total += die
    end
    print " => #{total} points"
    puts
    total
  end
end
