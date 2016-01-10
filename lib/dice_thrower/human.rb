require_relative 'player'


class Human < Player


  def user_input
    input = ""
    until (1..10).include? input
      puts "Please enter a number between 1 and 10."
      input = gets.chomp.to_i
    end
    input
  end


end