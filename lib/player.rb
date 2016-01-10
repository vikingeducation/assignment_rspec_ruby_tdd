
class Player

 attr_accessor :score, :type, :wins

  def initialize
    @wins =  0
    @score = 0
  end
  
  def self.build_computer
    Computer.new
  end

  def self.build_human
    Human.new
  end  

  def want_to_quit?
    inp = ""
    until inp.downcase == "q"
      print "Do ou want to quit ? <q or Q> : "
      inp = gets.chomp.to_i
    end
  
    inp
  
  end 

  def get_winner(player_2)
    add_to_wins(player_2)
  end
  
  def print_round_total
    puts ""
    puts "For player #{self.type.upcase}, SCORE is #{@score}"
  end
  
  private

  def add_to_wins(opponent)

    if @score > opponent.score
       @wins += 1
    elsif opponent.score > @score 
       opponent.wins += 1
       return opponent
    else
      return nil
    end
  end
 
end