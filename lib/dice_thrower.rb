require 'player'
require 'dice'

class DiceThrower

  def initialize(player = nil)
    @player = Human.new(self)
    @computer = Computer.new(self)
  end

  def play
    loop do
      player.roll
      break if quit?
      computer.roll
    end
  end

end
