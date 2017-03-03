require 'dice'

module DiceThrower
  class Computer
    attr_reader :name,
                :dice

    def initialize
      @name = 'Skynet'
      @dice = Dice.new
    end

    def roll_dice(num_rolls)
      raise 'The input is invalid.' unless num_rolls.is_a?(Fixnum)

      result = 0
      num_rolls.times { result += @dice.roll }

      result
    end
  end
end