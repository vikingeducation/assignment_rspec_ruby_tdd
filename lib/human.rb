
require_relative "../lib/player.rb"

class Human < Player

 attr_reader :type

  def initialize()
    super
    @type = "human"
  end

  def ask_how_many_dice?(max)
     num = 0
     until num.between?(1,max) 
       print "Enter the number of dice to roll (MAXIMUM #{max}) : "
       num = gets.chomp.to_i
     end
     num 
  end

end  