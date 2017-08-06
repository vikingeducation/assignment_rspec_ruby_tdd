require 'highline/import'

module DiceThrower
  class Human < Player
    def initialize(name = 'you', dice = Dice.new)
      super(name, dice)
    end

    def roll_dice
      answer = ask 'Enter number of dice to throw >' do |q|
        q.validate = /\A\d+|q\z/i
      end

      return (@quit = true) if answer == 'q'

      super(answer.to_i)
    end

    def quit?
      !!@quit
    end
  end
end
