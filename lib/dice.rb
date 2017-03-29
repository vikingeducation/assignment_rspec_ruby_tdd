class Dice
  def initialize
  end

  def single_roll
    value = (1..6).to_a.sample
    return value
  end
end
