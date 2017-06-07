class Game

  attr_reader :user_wins, :computer_wins

  def initialize(player = Player.new("Player 1"))
    @user = player
    @computer = Computer.new("Computer")
    @user_wins = 0
    @computer_wins = 0
  end

  def instructions
    puts "Welcome to Dice Thrower"
    puts "Instructions: "
    puts "Enter how many dice you would like to throw"
    puts "If your total is higher than the computer, you win!"
    puts "Enter 'q' to quit"
  end

  def play_game
    instructions
    loop do
      dice = @user.get_number_of_dice
      user_rolls = @user.roll_dice(dice)
      computer_rolls = @computer.roll_dice(dice)
      get_score(@user.get_sum(user_rolls), @computer.get_sum(computer_rolls))
      render_score
    end
  end

  def get_score(player_roll_total, computer_roll_total)
    if player_roll_total > computer_roll_total
      @user_wins += 1
    else
      @computer_wins += 1
    end
  end

  def render_score
    puts "******SCORE******"
    puts "#{@user.name}: #{@user_wins} wins"
    puts "#{@computer.name}: #{@computer_wins} wins"
    puts "*****************"
  end

end


class Player

  attr_reader :name, :dice

  def initialize(name)
    @name = name
    @dice = [1,2,3,4,5,6]
  end

  def get_number_of_dice
    num_of_dice = pick_dice
    if dice_valid?(num_of_dice)
      num_of_dice.to_i
    else
      get_number_of_dice
    end
  end

  def roll_dice(number_dice)
    array = []
    number_dice.times do
      array << @dice.sample
    end
    puts "Result(s) of roll(s): #{array}"
    array
  end

  def get_sum(array)
    array.inject(0) { |sum, x| sum + x }
  end

  private

  def pick_dice
    puts "How many dice would you like to roll?"
    gets.chomp
  end


  def dice_valid?(dice)
    if dice == "q"
      true
      exit
    elsif dice.to_i == 0 || dice == /[a-z]/
      puts "debug #{dice}"
      raise "That is not a valid option"
      false
    else
      true
    end
  end

end


class Computer < Player

  def initialize(name)
    super
  end

end

  # new_game = Game.new
  # new_game.play_game
