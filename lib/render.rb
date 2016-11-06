class Render
  def self.tie
    puts "You Tied!! What are the chances???"
  end

  def self.round_scores(pl1, pl2)
    puts "\n\nYou scored #{pl1}, player 2 scored #{pl2}"
  end

  def self.win

    puts "You Win!"
  end

  def self.loss
    puts "You Lost! Better luck next round.."
  end

  def self.score(pl1, pl2)
    puts "\n\nCurrent Win Count\n###############"
    puts "# Player 1: #{pl1} #"
    puts "# Player 2: #{pl2} #"
    puts "###############\n\n"

    puts "\n\nPick how many dice you want to roll, the player with the highest score wins\n"
    puts "Type 'q', 'quit', or 'exit' to end the game"
  end

  def self.long_wait
    puts "\n\nHold on to your pantyhose, this might take a while...\n\n"
  end

end