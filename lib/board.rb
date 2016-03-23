class Board

  def initialize
    @score_player = 0
    @score_computer = 0
  end

  def check_victory(player, computer)
    if tie?(player, computer)
      puts "It's a Tie !"
    elsif win?(player, computer)
      puts "You Win !"
      @score_player += 1
    else
      puts "You Loose !"
      @score_computer += 1
    end
  end

  def tie?(player, computer)
    return true if player == computer
  end

  def win?(player, computer)
    return true if player > computer
  end

  def print_choices(player, computer)
    puts "You have: #{player}"
    puts "The Computer have: #{computer}"
  end

  def render
    puts "***SCORE***"
    puts "player: #{@score_player}"
    puts "computer: #{@score_computer}"
    puts "***********"
  end
end