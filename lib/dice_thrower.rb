require_relative 'player.rb'
require_relative 'human.rb'
require_relative 'computer.rb'

class DiceThrower
  attr_reader :player1, :player2

  def initialize
    @player1 = Human.new
    @player2 = Computer.new
  end

  def game
    loop do
      render
      dice = gets.chomp
      if dice == 'q'
        break
      else
        @player1.set_dice(dice)
        @player2.set_dice(@player1)

        human_dice_total = @player1.throw_dice
        computer_dice_total = @player2.throw_dice

        victory_message(human_dice_total, computer_dice_total)
      end
    end
  end

  def render
    puts "Instructions:"
    puts "Enter how many dice you'd like to throw"
    puts "If your total is higher than the computer, you win!"
    puts "Enter 'q' to quit."
    puts ""
    puts "--------SCORE--------"
    puts "You: #{@player1.score} wins"
    puts "Computer: #{@player2.score} wins"
    puts "---------------------"
    puts ""
    puts "Enter number of dice to throw:"
  end

  def victory_message(score1, score2)
    if score1 > score2
      puts "Congratulations, you win!"
      @player1.score += 1
    elsif score2 > score1
      puts "Aww, the computer won."
      @player2.score += 1
    else
      puts "Oh wow, you tied!"
    end
  end
end