require 'dice'

module DiceThrower
  class Human
    attr_reader :name,
                :dice

    def initialize
      @name = 'You'
      @dice = Dice.new
    end

    def get_input
      input = nil
      loop do
        print "Enter number of dice to throw > "
        input = gets.chomp.downcase

        break if input == "q"

        break unless input.to_i == 0 
      end

      input == 'q' ? 'q' : input.to_i
    end

    def roll_dice(num_rolls)
      raise "Your input is invalid. Please try again." unless num_rolls.is_a?(Fixnum)

      result = 0
      num_rolls.times { result += @dice.roll }

      result
    end
  end
end