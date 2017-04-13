class DiceUI
  def welcome
    puts 'Welcome to Dice Thrower'
  end

  def instructions
    puts 'Instructions:'
    puts <<~EOS
            Enter how many dice you'd like to throw
            If your total is higher than the computer, you win!
            Enter 'q' to quit.
    EOS
  end

  def prompt_player
    print 'Enter number of dice to throw > '
    gets.chomp
  end

  def show_score(human_wins, computer_wins)
    puts "\n***** SCORE *****"
    puts "You: #{human_wins} wins"
    puts "CPU: #{computer_wins} wins"
    puts "*****************\n"
  end
end
