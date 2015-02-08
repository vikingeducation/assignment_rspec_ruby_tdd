class Board
  attr_reader :poles, :model_stack

  def initialize(height)
    @model_stack = (1..height).to_a.reverse
    @poles = empty_poles
    @poles[:l] = model_stack.dup
  end

  def move(turn)
    @poles[turn[:to]] << @poles[turn[:from]].pop
  end

  def render
    puts "L: #{poles[:l]}"
    puts "C: #{poles[:c]}"
    puts "R: #{poles[:r]}"
  end

  def winning?
    center_win? || right_win?
  end

  private

  def empty_poles
    {l: [],
     c: [],
     r: [] }
  end

  def center_win?
    poles[:c] == model_stack
  end

  def right_win?
    poles[:r] == model_stack
  end
end