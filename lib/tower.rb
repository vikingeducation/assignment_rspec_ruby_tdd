require 'pry'
class Game
  def initialize(height = 3)
    @board = Board.new(height)
    @player = Player.new(@board)
  end

  def play
    loop do
      @board.render
      @player.take_turn
      break if game_over?
    end

    endgame
  end

  private

  def endgame
    if @board.victory?
      puts "You won!!!"
      @board.render
    end
    puts "Thanks for playing!"
  end

  def game_over?
    @player.quitting? || @board.victory?
  end
end

class Board
  attr_reader :towers
  NUM_TOWERS = 3

  def initialize( height = 3 )
    raise "height must be an integer!" unless height.is_a?(Integer)

    @height = height
    @towers = Array.new(NUM_TOWERS) { Array.new }
    set_first_tower(@height)
  end

  def victory?
    towers[1].size == @height || towers[2].size == @height
  end

  def render
    (@height-1).downto(0) do |level|
      towers.each {|t| print (t[level] || " ").ljust(@height) }
      puts "\n"
    end
  end

  def make_move(move)
    return false unless valid?(move)
    first, second = parse(move)
    towers[second].push(towers[first].pop)
  end


  private

  #changes input to cardinal to access array
  def parse(move)
    return move[0] - 1, move[1] - 1
  end

  def valid?(move)
    return false unless well_formed?(move) && in_range?(move)
    first, second = parse(move)
    return false if towers[first].empty?
    towers[second].empty? || towers[first][-1] < towers[second][-1]
  end

  def well_formed?(move)
    move.all?{|m| m.is_a? Integer} && move.size == 2
  end

  def in_range?(move)
    move[0].between?(1, NUM_TOWERS) && move[1].between?(1, NUM_TOWERS)
  end

  # creates pyramid on first tower up to specified height.
  def set_first_tower(height)
    height.downto(1) { |width| @towers[0] << "o" * width }
  end



end

class Player

  def initialize(board)
    @quitting = false
    @board = board
  end

  def take_turn

    loop do
      print "Input your move: "
      move = gets.chomp.split(",")

      @quitting = true if move[0] =~ (/[qQ]/)
      move.map!{ |x| x.to_i }

      break if @board.make_move(move) || quitting?
      puts "That didn't work. Try again."
    end

  end

  def quitting?
    @quitting
  end

end

