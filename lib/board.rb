class Board
  attr_accessor :rods

  def initialize(number_of_discs)
    @rods = Array.new(3) { Array.new }

    number_of_discs.downto(1) { |disc| @rods[0] << disc }
  end


  def render

  end


  def process_move?(move_array)

    from_rod = move_array[0] - 1
    to_rod = move_array[1] - 1

    move_success = false
    move_success = true if move_available?(from_rod, to_rod)

    @rods[to_rod] << @rods[from_rod].pop

    move_success
  end


  private


  def move_available?(from, to)
    !rod_empty?(from) & ( rod_empty?(to) || from_less_than_to?(from, to) )
  end

  def rod_empty?(rod)
    @rods[rod].empty?
  end

  def from_less_than_to?(from, to)
    @rods[from].last < @rods[to].last
  end

end