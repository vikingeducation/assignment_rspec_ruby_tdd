require_relative "player"
require_relative "computer"


class DiceThrower

  def initialize 
    @player = Player.new
    @computer = Computer.new
    @player_score = 0
    @computer_score = 0
  end

  def play 
    display_instructions
    loop do 
      until @player.valid?
        @player.ask_dice_number
      end
      trigger_roll
      score 
      display_score
      break if quit?
    end
  end

  def display_instructions
    puts "Welcome to Dice Thrower!"
    puts "Here are the instructions:"
    puts "Enter how many dice you want to play with"
    puts "If your total is higher than the computer, you win!"
  end

  def who_won(player_roll, computer_roll)
    if player_roll > computer_roll
      return @player
    elsif player_roll < computer_roll
      return @computer
    else 
      return nil
    end
  end

  def score
    winner =  who_won(@player.roll, @computer.roll(@player.dice_number))
    
    if winner == @player
      @player_score += 1
    elsif winner == @computer 
      @computer_score += 1
    else
      nil
    end
  end

  def display_score
    puts "*" * 5 + " " + "Score" +  " " + "*" * 5
    puts "You: #{@player_score}"
    puts "Computer: #{@computer_score}"
    puts "*" * 17
  end

  def quit?
    puts "Do you want to quit? Enter q if you want to stop playing:"
    response = gets.chomp == "q"
  end

  def trigger_roll
    puts "Press any key to roll!"
    response = gets.chomp
    response = true
  end

end








