require 'highline/import'

module DiceThrower
  class Human < Player
    def initialize(name = 'you', dice = Dice.new)
      super(name, dice)
    end

    def roll_dice
      answer = ask 'Enter number of dice to throw >', Integer
      super(answer)
    end
  end
end
