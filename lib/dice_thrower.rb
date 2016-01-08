class DiceThrower

  def play
    until game_over?
      get_number_of_dice
      computer_roll
    end
  end

end
