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
      @human.last_input == 'q'
    end

    def quit
      puts "Goodbye!"
      exit
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