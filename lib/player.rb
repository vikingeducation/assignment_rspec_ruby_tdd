require_relative 'dice'

class Player
  attr_reader :score, :throw

  def initialize
    @score = 0
    @throw = 0
  end

  def choose_number
    puts
    print "Enter number of dice to throw > "
    number = STDIN.gets.chomp.strip.to_i
    until number.is_a?(Integer)
      puts "Please enter an integer."
      number = gets.chomp.strip.to_i
    end
    number
  end

  def throws(n=1)
    @throw = Dice.roll(n)
  end

  def play_again?
    puts
    puts "Another round? (y/n)"
    response = STDIN.gets.chomp.strip.downcase
    until %(y n).include?(response)
      puts "Please enter 'y' for yes or 'n' for no."
      response = gets.chomp.strip.downcase
    end
    response == 'y' ? true : false
  end

  def scores
    @score += 1
  end
end