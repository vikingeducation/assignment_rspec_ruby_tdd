class View

  def output(str)
    raise ArgumentError unless str.is_a?(String)
    puts str
  end

  def print_score(human, ai)
    puts '***** SCORE ******'
    puts "#{human.name}".ljust(10) + "#{human.wins} wins"
    puts "#{ai.name}".ljust(10) + "#{ai.wins} wins"
    puts '*****************'
    puts

  end

  def print_throws(human, ai)
    puts "You threw #{human.dice_throw}\n#{ai.name} threw #{ai.dice_throw}"
    puts "It's a draw" if ai.dice_throw == human.dice_throw
  end

end
