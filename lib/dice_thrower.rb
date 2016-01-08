require 'player'
require 'dice'

class DiceThrower
  attr_accessor :last_player_number

  def initialize(human = nil, computer = nil)
    @human = human || Human.new(self)
    @computer = computer || Computer.new(self)
    @quit = false
    @last_player_number = nil
  end

  def welcome_message
    puts "Welcome to Dice Thrower!"
  end

  def play
    welcome_message
    loop do
      @human.roll
      break if quit?
      @computer.roll
    end
  end

  def quit!
    @quit = true
  end

  def quit?
    @quit
  end

end
