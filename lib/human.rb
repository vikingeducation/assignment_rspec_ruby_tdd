require_relative "./dice"

module DiceThrower
  class Human
    attr_reader :name,
                :dice,
                :last_input

    def initialize
      @name = 'You'
      @dice = Dice.new
      @last_input = nil
    end

    def get_input
      loop do
        print "Please enter number of dice to throw > "
        input = gets.chomp.downcase
        @last_input = input == 'q' ? input : input.to_i

        break if @last_input == 'q'

        if @last_input == 0
          puts "That equals 0 dice to throw. Please try again."
        else
          break
        end
      end
    end

    def roll_dice(num_rolls)
      raise "Your input is invalid. Please try again." unless num_rolls.is_a?(Fixnum)

      result = 0
      num_rolls.times { result += @dice.roll }

      result
    end
  end
end