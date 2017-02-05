# Running of the game - user competing withe AI computer for the highest total of rolling die
require 'player'
require 'computer'
require 'human'

class Game

  attr_accessor :game

  def initialize
    @human = Human.new
    @computer = Computer.new
    @dice = Dice.new(6)
  end

  def play
    # Display user instructions
    instructions

    loop do
      puts "Enter number of dice to throw >"
      input = gets.chomp
      input_num = input.to_i

      if(((input_num).is_a? Numeric) && input_num != 0) 
      
        # Store the number of die
        @human.no_of_dice(input_num)
        @computer.no_of_dice(input_num)

        # Roll each of the die for the human player and computer
        @human.roll(input_num)
        @computer.roll(input_num)

        check_who_won
        statistics
        reset_player_totals
      end

      break if input == "q"   
    end
  end

  def instructions
    puts "Welcome to Dice Thrower"
    puts "Instructions:"
    puts "Enter how many dice you'd like to throw"
    puts "If your total is higher than the computer, you win!"
    puts "Enter 'q' to quit."
    puts ""
    puts "***** SCORE *****"
    puts "You:  0 wins"
    puts "Clue: 0 wins"
    puts "*****************"
    puts ""
  end

  # output running total
  def statistics
    puts "***** SCORE *****"
    puts "You: #{@human.wins} wins"
    puts "Clue: #{@computer.wins} wins"
    puts "*****************"
  end

  def check_who_won
    if @human.total > @computer.total
      puts "You won with #{@human.total}" 
      @human.wins += 1
    else
      puts "Computer won with #{@computer.total}"
      @computer.wins += 1
    end
  end

  def reset_player_totals
    @human.total, @computer.total = 0, 0
  end

end