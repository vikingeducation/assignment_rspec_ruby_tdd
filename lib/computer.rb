class Computer < Player

  def set_dice(human)
    raise TypeError.new("Input must be a Player") unless human.is_a?(Player)
    @dice = human.dice
  end
end