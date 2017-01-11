class Player
  attr_reader :name
  attr_accessor :wins, :dice_throw
  def initialize(name='Player 1', wins=0)
    @name = name
    @wins = wins
    @dice_throw
  end

  def throw_dice(num)
    raise ArgumentError unless num.is_a?(Integer)
    result = 0
    num.times do |n|
      result += rand(1..6)
    end
    @dice_throw = result
  end

  def reset_dice_throw
    @dice_throw = 0
  end


end
