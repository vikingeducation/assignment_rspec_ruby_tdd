require_relative 'player'


class Human < Player


  def ask_for_number
    puts "How many dice would you like to roll?"
    answer = gets.chomp.to_i
  end


end