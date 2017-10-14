require_relative 'human_player'
require_relative 'computer_player'
require 'pry'
class Game 

  attr_reader :player_1, :player_2, :human_wins, :computer_wins
  def initialize
    @player_1 = HumanPlayer.new
    @player_2 = ComputerPlayer.new
    @human_wins = 0
    @computer_wins = 0
  end

  def greeting 
    puts "**Welcome to Dice!**"
  end

  def prompt_for_number_of_dice
    puts "How many dice do you want to roll?"
  end
  
  def compute_total(arr)
    arr.reduce(:+)
  end

  def play 
    greeting
    prompt_for_number_of_dice
    get_number_of_dice
    compute_total(player_1.roll_dice)
    compute_total(player_2.roll_dice)
  end

end