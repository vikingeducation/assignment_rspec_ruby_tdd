class Board
  attr_reader :rods

  def initialize(number_of_discs)
    @rods = Array.new(3) { Array.new(number_of_discs) }
  end

end