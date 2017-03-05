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
      print "Please enter number of dice to throw > "
      input = gets.chomp.downcase
      @last_input = input == 'q' ? input : input.to_i
    end

    def roll_dice(num_rolls)
      raise "Your input is invalid. Please try again." unless num_rolls.is_a?(Fixnum)

      result = 0
      num_rolls.times { result += @dice.roll }

      result
    end
  end
end