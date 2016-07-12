def stock_picker(array)
  raise "Cannot pass empty array." if array.empty?
  raise "Cannot pass array with one element." if array.length == 1

  max_index = 0
  min_index = 0
  max_value = 0
  j = i
  while j < array.length
    if (array[j] - array[i]) > max_value
      max_index = j
      min_index = i
      max_value = array[j] - array[i]
    end
    j += 1
  end
  [min_index,max_index]
end

def anagrams(str,arr)
  arr.select do |w| 
    w.upcase.chars.all? do |c|
      str.upcase.chars.include?(c)
    end 
  end.map(&:upcase)
end

class Game

  def roll_dice(n = 1)
    prng = Random.new
    roll_outcomes = Array.new(n) { prng.rand(1..6) }
    roll_outcomes.reduce(0, :+)
  end

  def dice_outcomes(number_of_dice, number_of_rolls)
    # Create a hash to store the results of each roll
    # The default value of the hash is 0
    dice_roll_stats = Hash.new(0)

    # Roll the dice and record the results
    number_of_rolls.times do
      current_roll = roll_dice(number_of_dice)
      dice_roll_stats[current_roll] += 1
    end

    # Display the stats for all the rolls
    max_value_of_a_roll = number_of_dice * 6
    padding = max_value_of_a_roll.to_s.length
    sorted_dice_stats = dice_roll_stats.sort.to_h
    sorted_dice_stats.each do |key, value|
      puts "#{key.to_s.rjust(padding)}: #{"#" * value}"
    end
  end

end
