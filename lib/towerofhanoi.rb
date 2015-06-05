require "board"

class TowerOfHanoi

  def initialize(number_of_discs)
    raise "Discs fewer than 3" if number_of_discs < 3

    @board = Board.new(number_of_discs)
    #@player = Player.new
  end


  def play
    #game loop
      #loop will start here
        move = get_move
        @board.process_move?(move)
        #send to board (accept & render vs reject)
      #end

      #finish turn

      #check victory to break
    #end
  end


  def get_move
    puts "Enter your move in the format 1,3:"
    validate_move(gets.chomp)
  end


  def validate_move(input_move)
    raise "Input is not a string" unless input_move.is_a?(String)

    move_array = input_move.split(",")

    get_move if move_array.size != 2

    from_rod = move_array[0].strip.to_i
    to_rod = move_array[1].strip.to_i

    if from_rod.between?(1,3) && to_rod.between?(1,3)
      [from_rod, to_rod]
    else
      get_move
    end
  end

end