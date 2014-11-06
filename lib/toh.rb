class TowerOfHanoi
  attr_reader :board

  def initialize(height=3)
    @board = Array.new([Array.new(height){1}, Array.new, Array.new])
  end

end