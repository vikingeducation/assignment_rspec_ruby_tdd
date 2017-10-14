class ComputerPlayer

  def roll_dice 
    rolls = []
    $number_of_dice.times { rolls << (1..6).to_a.sample }
    rolls
  end
end