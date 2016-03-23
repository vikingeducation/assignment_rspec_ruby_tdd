class Player
  def roll_dice(num_dice = 1)
    total = 0
    num_dice.times { total += rand(1..6) }
    total
  end
end