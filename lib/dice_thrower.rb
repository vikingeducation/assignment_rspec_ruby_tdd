# lib/dice_thrower.rb
class Die
  def initialize
    @val = 0
  end
  def val
    @val = rand(1..6)
  end
end

class Score
  attr_accessor :player, :comp
  def initialize
    @player = 0
    @comp = 0
  end

  def render
    # prints the outcome of the roll
    puts "#
    # ***** SCORE *****
    # You:  #{@player} wins
    # Computer: #{@comp} wins
    # *****************
    #"
  end
end

class Game
  def initialize
    @die = Die.new
    @score = Score.new
  end
  def throw
    puts "# Welcome to Dice Thrower
    # Instructions:
    # Enter how many dice you'd like to throw
    # If your total is higher than the computer, you win!
    # Enter 'q' to quit."
  loop do
      # get_num_dice
      det_outcome(get_num_dice)
      @score.render
      # break
  end
end

  def valid_input?(input)
    input.is_a?(Integer) && input > 0 ? true : false
  end

  def get_num_dice
    num_dice = 1
    loop do
      puts '# Enter number of dice to throw >'
      input = gets.chomp
      end_game(input)
      if valid_input?(input.to_i)
        num_dice = input.to_i
        break
      else
        puts "Enter an integer greater than 0!"
      end
    end
    num_dice
  end

  def det_outcome(num_dice)
    p_roll = 0
    c_roll = 0
    num_dice.times do
      p_roll += @die.val
      c_roll += @die.val
    end
    puts "Player rolled #{p_roll}; Computer rolled #{c_roll}"
    unless p_roll == c_roll
      if p_roll > c_roll
        @score.player += 1
        puts "Player wins!"
      else
        @score.comp += 1
        puts "Computer wins!"
      end
    else
      "It's a tie!"
    end
  end

  def end_game(input)
    exit if input.upcase == "Q"
  end

end

g = Game.new
g.throw
# def end_game
#
#
# def outcome
#   @player.num_dice = @num_dice
#   @comp.num_dice = @num_dice
#   player_roll = @player.roll_val
#   comp_roll = @comp.roll_val
#   if player_roll > comp_roll
#     @player.score += 1
#     puts "Player wins"
#   elsif player_roll < comp_roll
#     @comp.score += 1
#     puts "Computer wins"
#   elsif tie
#     puts "It was a tie!"
#   end
# end
#
# def new_outcome
#
# end

# def roll_total(player)
#   total = 0
#   @num_dice.times {total += Die.new.val}
#   player.
# end
#
# def tie
#   @player.roll_val == @comp.roll_val ? true : false
# end
