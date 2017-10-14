class HumanPlayer
  attr_reader :number_of_dice

  def select_number_of_dice
    $number_of_dice = gets.chomp.to_i
  end

  def roll_dice
    rolls = []
    $number_of_dice.times { rolls << (1..6).to_a.sample }
    rolls
  end

end