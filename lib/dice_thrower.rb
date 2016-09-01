class Dice
  def roll
    rand(6) + 1
  end
end

class Player

  def get_num_dice
    puts "Enter number of dice to throw >"
    input = nil
    until input.is_a?(Fixnum)
      input = gets
    end
    input
  end

  def roll_dice(dice)
    sum = 0
    dice.times do
      sum += Dice.new.roll
    end
    sum
  end

end

class DiceThrower
  attr_reader :player_wins, :computer_wins

  def initialize
    @player = Player.new
    @computer = Player.new
    @player_wins = 0
    @computer_wins = 0
  end

  def play
    welcome_message
    12.times do
      num_dice = @player.get_num_dice
      @human_score = @player.roll_dice(num_dice)
      @computer_score = @computer.roll_dice(num_dice)
      compare_scores
      display_scores
    end
  end

  def compare_scores
    if @human_score > @computer_score
      @player_wins += 1
    elsif @computer_score > @human_score
      @computer_wins += 1
    else
      puts "# It was a tie!"
    end
  end

  def display_scores
    puts "#"
    puts "#****SCORE****"
    puts "You: #{@player_wins}"
    puts "Comp: #{@computer_wins}"
    puts "#*************"
    puts "#"
  end

  def welcome_message
    puts "# Welcome to Dice Thrower"
    puts "# Instructions:"
    puts "# Enter how many dice you'd like to throw"
    puts "# If your total is higher than the computer, you win!"
    puts "# Enter \'q\' to quit."
  end
end