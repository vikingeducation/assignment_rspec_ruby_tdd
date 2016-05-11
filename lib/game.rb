class Game

  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def start
    puts "Welcome to Dice Thrower\n\nInstructions:\nEnter how many dice you'd like to throw\nIf your total is higher than the computer, you win!\nEnter 'q' to quit.\n\n"
    render
    loop do
      break if human.get_input == 'q'
      if check_input(human.get_input)
        # TODO: complete this
      end
    end
    puts "You quit the game!\n\n"
    render
  end

  # #start method
    # game instructions
    # render scores
    # start loop
      # get human input
        # if 'q' then break loop
        # else human validate input
      # generate dice rolls
      # increment scores
      # render scores

  def render
    puts "***** SCORE *****\nYou: #{human.score} wins\nComputer: #{computer.score} wins\n*****************\n\n"
  end

  def check_input
    # TODO: complete this
  end

  def check_winner(number_of_dice)
    if @human.dice_roll(number_of_dice) > @computer.dice_roll(number_of_dice)
      @human.score += 1
    elsif @human.dice_roll(number_of_dice) < @computer.dice_roll(number_of_dice)
      @computer.score += 1
    end
  end

end

class Player
  attr_reader :score

  def initialize
    @score = 0
  end

  def dice_roll(number_of_dice)
    points = 0
    number_of_dice.times do
      points += rand(1..6)
    end
    return points
  end

end

class Human < Player

  def get_input
    puts "Enter number of dice to throw >"
    input = gets.chomp
    input
  end

end

class Computer < Player
end
