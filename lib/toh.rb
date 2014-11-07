class TowerOfHanoi
  attr_reader :board

  def initialize(height=3)
    @board = {"a" => Array.new(height){1}, "b" => Array.new, "c" => Array.new }
  end

  def play
    move('ab')
  end

  def move(coordinates)
    coordinates = coordinates.split('')
    if coordinates.all? { |coordinate| ['a','b','c'].include?(coordinate) } && coordinates[0] != coordinates[1]
      @board[coordinates[1]].push(@board[coordinates[0]].pop)
    else
      puts "Invalid coordinates"
    end
  end



end