class Player
  attr_accessor :dice

  def initialize
    @dice = nil
  end

  def self.build_human_player
    Human.new
  end

  def self.build_computer_player
    Computer.new
  end

end