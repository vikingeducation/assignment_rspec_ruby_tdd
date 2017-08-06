module DiceThrower
  class Player
    attr_reader :name, :dices_rolled

    def initialize(name = nil, dice = Dice.new)
      @name = name
      @dice = dice
    end

    def roll_dice(number)
      @dices_rolled = []

      number.times { @dices_rolled << @dice.roll }
    end
  end
end
