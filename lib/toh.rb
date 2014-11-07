class TowerOfHanoi
  attr_reader :board

  def initialize(height=3)
    @board = Array.new([Array.new(height){1}, Array.new, Array.new])
  end

  def play
    move('ab')
  end

  def move(coordinates)
    coordinates = coordinates.split('')
    if coordinates.all? { |coordinate| ['a','b','c'].include?(coordinate) }
    else
      puts "Invalid coordinates"
    end
  end



end