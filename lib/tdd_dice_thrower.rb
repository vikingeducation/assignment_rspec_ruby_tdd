# Task
# Build a simple game where a human player enters a number of dice and then
# rolls that many different 6-sided dice. The computer then rolls the same
# number of dice. The player with the higher total sum wins the round. Score
# is kept on a running basis until the game is exited.

# human enters a number of dice
# rolls that many differnet 6-sided dice
# same for computer's turn
# score: higher total sum wins the round
# loop

class DiceThrower

  attr_accessor :score

  def initialize
    @score = {p1: 0, p2: 0}
  end

  def print_score
    puts "\n*** SCORE ***"
    score.each do |player, score_|
      puts "#{player}: #{score_} wins"
    end
    puts "*************"
  end

  def instructions
    ["Welcome to Dice Thrower",
     "Instructions:",
     "Enter how many dice you'd like to throw",
     "If your total is higher than the computer, you win!",
     "Enter 'q' to quit."].each{ |msg| puts msg }
  end

  def prompt_input
    print "\nEnter number of dice to throw > "
    input = gets.chomp
    if input == "q"
      false
    elsif input.to_i <= 0
      puts "Enter a valid number"
      prompt_input
    else
      input.to_i
    end
  end

  def roll_dice(n)
    (0...n).reduce(0) do |acc, i|
      acc + rand(1..6)
    end
  end

  def game_loop
    print_score
    n = prompt_input
    return if n == false
    # roll dice
    p1, p2 = roll_dice(n), roll_dice(n)
    # declare dice points
    puts
    puts "player 1 rolled #{p1}"
    puts "player 2 rolled #{p2}"
    # declare winner
    puts
    if p1 > p2
      score[:p1] += 1
      puts "player 1 wins"
    elsif p2 > p1
      score[:p2] += 1
      puts "player 2 wins"
    elsif p1 == p2
      puts "DRAW!"
    end
    game_loop
  end

  def play
    instructions
    game_loop
  end

end
