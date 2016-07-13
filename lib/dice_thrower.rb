class Dice
  def roll
    rand(6) + 1
  end
end

class Player
  def get_num_of_dice
    puts "How many dice would you like to play with?"
    input = nil
    until input.is_a?(Fixnum)
      input = gets.chomp.to_i
    end
    input
  end

  def play_again?
    puts "Would you like to play again?"
    input = nil
    until input == 'y' || input == 'yes' || input == 'n' || input == 'no'
      input = gets.chomp
    end
    if input == 'y' || input == 'yes'
      true
    else
      false
    end
  end
end

class Game
  attr_reader :score
  def initialize(player_klass = Player)
    @score = [0, 0]
    @player = player_klass.new
  end

  def play
    welcome_message
    begin
      compare_dice(get_player_dice, get_computer_dice)
      print_score
    end while play_again?
  end

  def get_player_dice
    return_array = []
    @num_of_dice = @player.get_num_of_dice
    @num_of_dice.times { return_array << Dice.new.roll }
    return_array.reduce(:+)
  end

  def compare_dice(player_dice )
  end

end
