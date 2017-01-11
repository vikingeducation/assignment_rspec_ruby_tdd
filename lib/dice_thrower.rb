require_relative 'player'
require_relative 'view'

class DiceThrower
  def initialize
    @human = Player.new("Human")
    @view = View.new
    @ai = Player.new('Computer')
    @dice = 0
  end

  def game_on

    welcome
    loop do
      get_dice_num
      get_throws
      @view.print_throws(@human, @ai)
      update_player_wins
      @view.print_score(@human, @ai)
      reset_round
    end

  end

  def check_quit
    exit if ['q', 'quit'].include?(@dice)
  end

  def get_dice_num
    ask_for_dice_num until valid_num?
  end

  def get_throws
    @human.throw_dice(@dice)
    @ai.throw_dice(@dice)
  end

  def update_player_wins
    @human.wins += 1 if @human.dice_throw > @ai.dice_throw
    @ai.wins += 1 if @ai.dice_throw > @human.dice_throw
  end


  def valid_num?
    return false unless @dice
    unless @dice.between?(1,5)
      @view.output("Please enter a digit between 1 and 5 inclusive")
      return false
    end
    true
  end

  def ask_for_dice_num
    @view.output('Would you like to throw 1, 2, 3, 4 or 5 dice?')
    @dice = gets.strip
    check_quit
    @dice = @dice.to_i
  end

  def print_score
    @view.print_score(@human, @ai)
  end

  def reset_round
    @dice = 0
    @human.reset_dice_throw
    @ai.reset_dice_throw
  end

  def welcome
    @view.output('Welcome to Dice Thrower—a game of pure, absolute dumb luck!')
  end
end
