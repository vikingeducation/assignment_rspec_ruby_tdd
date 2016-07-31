class Player

  def input
    puts "How many dices do you want to throw? (q to quit the game)"
    output = gets.chomp
    return "q" if output == "q"
    until (output.to_i > 0) && (output.to_i == output.to_f)
      puts "Please input a positive integer"
      output = gets.chomp
    end
    output.to_i
  end

  def throw_dice dices
    sum = 0
    dices.times do
      sum += rand(1..6)
    end
    sum
  end
end
