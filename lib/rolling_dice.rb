# Find result of rolling (throwing) n 6-sided dice. Result of rolling 1 die is rand(1..6) - (rand for random between 1 and 6). Result for n dice = sum of results of separate throws.

def roll_dice(n)     
  score = 0            # n = number of dice
  n.times do |number|
    score = score + rand(1..6)
  end
  return score
end


# Main program

print "Enter number of dice: "
number_of_dice = gets.chomp.to_i
if number_of_dice < 1
  number_of_dice = 1    # default value
end
score = roll_dice(number_of_dice)
puts "Result of rolling #{number_of_dice} dice = #{score}"

# End
