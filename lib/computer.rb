
# Rolls dice against the human player
class Computer < Player

  attr_accessor :num_dice, :total, :dice

  def initialize
    super
  end
end