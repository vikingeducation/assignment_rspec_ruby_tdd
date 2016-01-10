

require_relative '../lib/player.rb'

class Computer < Player
 
  attr_reader :type

  def initialize() 
    super
    @type = "computer"
  end  
 
  def ask_how_many_dice?(max)
     return (1..max).to_a.sample
  end

end

