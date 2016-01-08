class Dice
  def roll(number_of_dice)
    total = 0
    number_of_dice.times do
      total += (1..6).to_a.sample
    end
    total
  end
end
