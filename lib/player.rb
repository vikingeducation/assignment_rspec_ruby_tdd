class Player

  def throw_dice
    dices = input
    until valid_dices dices
      puts 'Input should be positive integer'
      dices = input
    end
    rand(1..6) * dices
  end

  def input
    puts 'How many dice do you want to throw?(q to quit)'
    gets.chomp.to_i
  end

  def valid_dices dices
    true if dices.is_a? Integer && dices > 0
  end

end
