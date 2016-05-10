class Game

  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def start
    puts "Welcome to Dice Thrower\nInstructions:\nEnter how many dice you'd like to throw\nIf your total is higher than the computer, you win!\nEnter 'q' to quit."
    render
  end

  # #start method
    # game instructions
    # render scores
    # start loop
      # get human input
        # validate input
      # get computer input
      # generate dice rolls
      # increment scores
      # render scores

  def render
    puts "***** SCORE *****\nYou: #{human.score} wins\nComputer: #{computer.score} wins\n*****************"
  end

  # generate random dice rolls
    # pass rolls to increment scores

  # increment_score


end

class Player

  attr_reader :score

  def initialize
    @score = 0
  end

end

class Human < Player

  # def get_input
    # unless valid_input?
      # get_input

end

class Computer < Player

  # computer_input

end
