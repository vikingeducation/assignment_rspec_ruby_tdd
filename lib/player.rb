class Player

  def initialize(dice: Dice.new)
    @dice = dice
  end

  def ask_for_number
    input = gets.chomp

    return false if input == "quit"
    return ask_for_number unless (1..6) === input.to_i

    input.to_i
  end

  def roll
    @dice.roll
  end
end
