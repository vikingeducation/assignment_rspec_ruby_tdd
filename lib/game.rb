require 'player'

class Game
  def initialize
    @player_1 = Player.build_human
    @player_2 = Player.build_computer
  end

  def play
    print_intro
    rolls = ask_for_throws
    until rolls == "q"
      compute_rolls(rolls)
      print_current_score
      rolls = ask_for_throws
    end
    print_victory
  end

  def print_intro
    puts "\nWELCOME TO DICE THROWA!!!\n\n"
  end

  def ask_for_throws
    puts "\nEnter number of dice throws (or \"q\" to quit):\n"
    input = gets.chomp
    return input if input == "q"
    input_int = input.to_i
    until input_int > 0
      puts "\n\nInvalid Input!\n\n"
      puts "\nEnter number of dice throws (or \"q\" to quit):\n"
      input = gets.chomp
      return input if input == "q"
      input_int = input.to_i
    end
    return input_int
  end

  def compute_rolls(roll_count)
    @player_1.score += Dice.roll_multiple(roll_count)
    @player_2.score += Dice.roll_multiple(roll_count)
  end

  def print_current_score
    puts "\nSCORE:\nYou:    #{@player_1.score}\nComp:   #{@player_2.score}\n"
  end

  def print_victory
    p1_score = @player_1.score
    p2_score = @player_2.score
    if p1_score > p2_score
      puts "\nPlayer 1 Wins!\n"
    elsif p1_score == p2_score
      puts "\nIt's a Tie!\n"
    else
      puts "\nPlayer 2 Wins1\n"
    end
    return nil
  end

end

#g = Game.new
#g.play
