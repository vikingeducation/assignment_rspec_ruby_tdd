class Player
  attr_accessor :dice, :score

  def initialize
    @dice = nil
    @score = 0
  end

  def self.build_human_player
    Human.new
  end

  def self.build_computer_player
    Computer.new
  end

  def throw_dice
    dice_total = 0
    @dice.times { dice_total += (1..6).to_a.sample }
    dice_total
  end

end