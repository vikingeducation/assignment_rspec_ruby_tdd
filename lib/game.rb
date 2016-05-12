class Game

  attr_reader :computer, :human

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def start
  	puts "Roll dice and beat the computer! 'q' to quit the game."
  	render
  	loop do
  	  input = @human.get_input
  	  if input == 'q'
  	  	break
  	  else
  	  	check_input(input)
  	  	render
  	  end
    end
    puts "You have quit the game!"
    render
  end

  def render
  	puts "***************"
  	puts "Your Wins: #{@human.score}"
  	puts "Computer Wins: #{@computer.score}"
  	puts "***************"
  end

  def check_input(input)
  	num_dice = input.to_i
  	if num_dice < 1
  	  puts "Invalid Input"
  	  check_input(@human.get_input)
  	else
  	  generate_play(num_dice)
  	end
  end

  def generate_play(num_dice)
  	@computer.current, @human.current = 0, 0
  	num_dice.times do
  	  @computer.current += rand(1..6)
  	  @human.current += rand(1..6)
  	end
  	check_winner(@computer.current, @human.current)
  end

  def check_winner(computer, human)
  	if computer > human
  	  @computer.score += 1
  	else
  	  @human.score += 1
  	end
  end


end

class Player

  attr_accessor :score, :current

  def initialize
  	@score = 0
  	@current = 0
  end

end

class Human < Player

  def get_input
    puts "Enter number of dice to throw >"
    input = gets.chomp
    return input
  end

end

class Computer < Player

end
