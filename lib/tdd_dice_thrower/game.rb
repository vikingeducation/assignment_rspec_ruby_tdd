require_relative 'human_player'
require_relative 'computer_player'
require 'pry'
class Game 

  attr_reader :player_1, :player_2, :player_1_total, :player_2_total
  attr_accessor :human_wins, :computer_wins
  def initialize
    @player_1 = HumanPlayer.new('Mike')
    @player_2 = ComputerPlayer.new('Kit')
    @human_wins = 0
    @computer_wins = 0
  end

  def greeting 
    puts "**Welcome to Dice Thrower!**"
  end

  def prompt_for_number_of_dice
    puts "How many dice do you want to roll?"
  end
  
  def compute_totals
    @player_1_total = player_1.roll_dice.reduce(:+)
    @player_2_total = player_2.roll_dice.reduce(:+)
  end

  def display_totals
    puts "Your total is #{player_1_total}"
    puts "The computer's total is #{player_2_total}"
  end

  def determine_winner
    if @player_1_total > @player_2_total
      self.human_wins += 1
      player_1.name
    elsif @player_2_total > @player_1_total
      self.computer_wins += 1
      player_2.name
    end
  end

  def display_results
    winner = determine_winner
    unless winner == nil
      puts "#{winner} wins!"
    else
      puts "It's a tie"
    end
    puts "#{HumanPlayer.name} has #{human_wins} wins"
    puts "#{ComputerPlayer.name} has #{computer_wins} wins"
    puts "Play again? (yes/no)"
  end

  def play_again?
    play_again = gets.chomp.downcase
    play_again == 'yes' ? true : false
  end

  def game_loop
    loop do
    prompt_for_number_of_dice
    player_1.select_number_of_dice
    compute_totals
    display_totals
    display_results
    break if !play_again?
  end
  end

  def play 
    greeting
    game_loop
  end

end

#Game.new.play