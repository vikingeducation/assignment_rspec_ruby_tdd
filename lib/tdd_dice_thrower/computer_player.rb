class ComputerPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def roll_dice(number_of_dice) 
    rolls = []
    number_of_dice.times { rolls << (1..6).to_a.sample }
    rolls
  end
end