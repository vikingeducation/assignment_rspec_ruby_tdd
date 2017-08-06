require 'highline/import'

module DiceThrower
  class Human
    attr_reader :name, :dices_rolled

    def initialize(name = 'you', dice = Dice.new)
      @name = name
      @dice = dice
    end

    def roll_dice
      answer = ask 'Enter number of dice to throw >', Integer
      @dices_rolled = []

      answer.times { @dices_rolled << @dice.roll }
    end
  end
end
