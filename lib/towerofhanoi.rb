require "./board"

class TowerOfHanoi

  def initialize(number_of_discs)
    raise "Discs fewer than 3" if number_of_discs < 3

    @board = Board.new(number_of_discs)
    @turn_count = 0
  end


  def play
    puts "Welcome to Tower of Hanoi!  Let's get started."
    # game loop
    loop do

      # turn loop
      loop do
        move = get_move
        move_success = @board.process_move?(move)
        if move_success
          break
        else
          puts "That move is not available on the board."
        end
      end

      @turn_count += 1

      break if @board.victory
    end

    end_game
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
      puts "That input appears invalid.  Please try again."
      get_move
    end
  end


  private


  def end_game
    puts "Thanks for playing!  You completed the puzzle in #{@turn_count} turns."
  end

end