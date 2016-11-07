class Game

  attr_reader :human, :computer, :board

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def run
    Render.welcome
    Render.instructions
    puts
    loop do 
      Render.show_scores(@human.score,@computer.score)
      Render.enter_dice
      num_dice = @human.set_dice_num
      players_roll(num_dice)
      display_scores
      if @human.total > @computer.total 
        puts "You win!"
        @human.update_score
      elsif @human.total < @computer.total 
        puts "Computer wins!"
        @computer.update_score
      else
        puts "Tie!"
      end
      break unless play_again?
    end
  end

  def play_again?
    puts
    print "Play again? (y/n): "
    begin 
      input = gets.chomp  
    end until input.downcase == 'y' || input.downcase == 'n'
    input.downcase == 'y'
  end

  def players_roll(num_dice)
    @human.roll_dice(num_dice)
    @computer.roll_dice(num_dice)
  end

  def display_scores
    puts "Your score: #{@human.total}"
    puts "Computer's score: #{@computer.total}" 
  end

end

################################ => ######

class Player

  attr_accessor :total, :score

  def initialize
    @total = 0
    @score = 0
  end

  def roll_dice(num_dice)
    @total = 0
    num_dice.times { @total += rand(1..6) }
    @total
  end

  def update_score
    @score += 1
  end

end

class Human < Player
  
  def set_dice_num
    input = gets.chomp
    raise "Error: invalid input" unless valid_input?(input)
    input.to_i
  end

  private

  def valid_input?(input)
    return false if input.to_i < 1 # also covers non-digits
    true
  end

end

class Computer < Player

end

######################################

class Render

  def self.welcome 
    puts
    puts "Welcome to Dice Thrower"
  end

  def self.instructions
    puts
    puts "Instructions:"
    puts "Enter how many dice you'd like to throw"
    puts "If your total is higher than the computer, you win!"
    puts "Enter 'q' to quit."
  end

  def self.show_scores(player_score, computer_score)
    puts
    puts "***** SCORE *****"
    puts "You:\t#{player_score} wins"
    puts "Clue:\t#{computer_score} wins"
    puts "*****************"
  end

  def self.enter_dice
    puts
    print "Enter number of dice to throw: "
  end

end