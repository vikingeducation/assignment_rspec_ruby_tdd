require_relative "./dice"

module DiceThrower
  class Human
    attr_reader :name,
                :dice,
                :times_to_roll

    def initialize
      @name = 'You'
      @dice = Dice.new
      @times_to_roll = nil
    end

    def get_input
      loop do
        print "Please enter number of dice to throw > "
        input = gets.chomp.downcase
        @times_to_roll = input == 'q' ? input : input.to_i

        break if @times_to_roll == 'q'

        if @times_to_roll == 0
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