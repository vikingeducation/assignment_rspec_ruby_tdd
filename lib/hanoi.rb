class TowerOfHanoi

  attr_reader :has_won, :blocks, :board, :tower_one, :tower_two, :tower_three
  def initialize( blocks )
    raise ArgumentError, "Only pass ints!" unless blocks.is_a? Integer
    @blocks = blocks
    @board = [blocks,0,0]
    @has_won = false
    @tower_two, @tower_three = Array.new(3) { [] }
    @tower_one = []
    @blocks.downto(1) { |num| @tower_one << num }
    @all_towers = [@tower_one, @tower_two, @tower_three]
  end

  def determine_win
    if @board[2] == @blocks
      true
    end
  end

  def move_input( from_to )
    if from_to == "q"
      exit
    else
      from_to = from_to.split(",")
      input_error_checking( from_to )
      from_to = from_to.map(&:to_i)
      fix_move_positions( from_to )
      move_error_checking( from_to )
    end
  end

  def input_error_checking( from_to )
    if from_to.length < 2 || from_to.length > 2
      raise ArgumentError, "Wrong number of moves! Please try again."
    end
    from_to.each do |i|
      if i == "0"
        raise ArgumentError, "You entered 0 for a to or from position! Please try again."
      elsif i.to_i == 0
        raise ArgumentError, "You entered a non-integer! Please try again."
      end
    end
  end

  def move_error_checking( from_to )
    from_to = from_to.map(&:to_i)
    move_block_check = @all_towers[from_to[0]][@all_towers[from_to[0]].length - 1]
    if @all_towers[from_to[0]-1].empty?
      raise ArgumentError, "Tried to move from position with no blocks!"
    elsif !@all_towers[from_to[1]-1].empty? && move_block_check > @all_towers[from_to[1]][0]
      raise ArgumentError, "Can't do that!"
    else
      move_block( from_to )
    end
  end

  def move_block( from_to )
    from_to = from_to.map(&:to_i)
    move_block = @all_towers[from_to[0]-1].pop
    @board[from_to[0]-1] -= 1
    @board[from_to[1]-1] += 1
    @all_towers[from_to[1]-1].push(move_block)
    determine_win
  end

  def render
    puts ""
    puts "Current board:"
    puts ""
    count = @blocks
    while count >= 0
      puts "o" * nil_check(@tower_one[count]) + "\t" + "o" * nil_check(@tower_two[count]) + "\t" + "o" * nil_check(@tower_three[count])
      count -= 1
    end
    puts ""
    puts "One\tTwo\tThree"
    puts ""
  end

  def nil_check ( block )
    if block == nil
     return 0
    else
      return block
    end
  end

  def play
    loop do
      render
      from_to = gets.chomp
      move_input( from_to )
      if determine_win
        render
        puts "You won!"
        puts ""
        break
      end
    end
  end

end