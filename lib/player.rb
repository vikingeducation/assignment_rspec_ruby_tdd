require 'dice'

class Player

  attr_reader :name
  attr_accessor :dice, :score

  def initialize(name)
    @name = name
    @dice = Dice.new
    @score = 0
  end

  private_class_method :new

  #factory methods
  def self.build_human
    new( "1" )
  end

  def self.build_computer
    new( "2" )
  end
end
