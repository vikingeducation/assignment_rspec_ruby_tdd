class Player
  attr_reader :score

  def initialize
    @score = 0
  end

  def roll_dice(num)
    raise ArgumentError unless num.class == Fixnum && (1..10).include?(num)
    collector = []
    num.times { collector << (1..6).to_a.sample }
    collector
  end
end
