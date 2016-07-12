class Game

  attr_reader :user, :computer

  def initialize()
    @user = Player.new("Human_Mike")
    @computer = Player.new("Bot_Adrian")
    @count = 0
    @winner = nil
  end

  def throw
    print "Enter how many dice you you'd like to throw: "
    @count = gets

    @count.to_i.times do |index|
      @user.rolling
      @computer.rolling
    end

    decide_winner
  end

  def decide_winner
    puts "total...[#{@user.name}:#{@computer.name}] => [#{@user.sum} :: #{@computer.sum}]"
    @winner = (@user.sum > @computer.sum ) ?  @user: @computer unless @user.sum == @computer.sum
    puts (@winner.nil?) ?  "Tie, nobody won~" : "#{@winner.name} won the game!!!"
  end

end

class Player
  attr_accessor :points
  attr_reader :name

  def initialize(name)
    @name = name
    @points = []
    @dice = Dice.new
  end

  def rolling 

    @points.push(@dice.roll)
    puts "#{@name} rolled a #{@points[-1]}"
  end

  def sum
    tot = 0
    @points.each { |num| tot+= num }
    tot
  end
end

class Dice
  def roll
    1+ rand(6)
  end
end


# g = Game.new
# g.throw
