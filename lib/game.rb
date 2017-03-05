require_relative './human'
require_relative './computer'

module DiceThrower
  class Game
    attr_reader :human,
                :computer,
                :human_score,
                :computer_score

    def initialize(human = nil, computer = nil)
      @human = human.nil? ? Human.new : human
      @computer = computer.nil? ? Computer.new : computer
      @human_score = 0
      @computer_score = 0
    end

    def play
      print_instructions
      
      loop do
        human.get_input

        quit if over?

        human_roll = human.roll_dice(human.times_to_roll)
        computer_roll = computer.roll_dice(human.times_to_roll)

        puts "#{human.name} rolled: #{human_roll}"
        puts "#{computer.name} rolled: #{computer_roll}"
        puts "It's a tie!" if tie?(human_roll, computer_roll)
          
        if human_roll > computer_roll
          increment_human_score
        elsif computer_roll > human_roll
          increment_computer_score
        end

        display_current_scores
      end
    end

    def increment_human_score
      @human_score += 1
    end

    def increment_computer_score
      @computer_score +=1 
    end

    def tie?(human_roll, computer_roll)
      human_roll == computer_roll
    end

    def over?
      @human.times_to_roll == 'q'
    end

    def quit
      puts "Goodbye!"
      exit
    end

    def display_current_scores
      puts
      puts "***** SCORE *****"
      puts "#{human.name}: #{human_score} wins"
      puts "#{computer.name}: #{computer_score} wins"
      puts "*****************"
      puts
    end

    def print_instructions
      puts "Welcome to Dice Thrower!"
      puts "Instructions:"
      puts "Enter how many dice you'd like to throw."
      puts "If your total is higher than the computer, you win!"
      puts "Enter 'q' to quit."
      puts
    end
  end
end

if $0 == __FILE__
  DiceThrower::Game.new.play
end
