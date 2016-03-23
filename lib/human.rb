require_relative 'player'

class Human < Player
  def get_input
    loop do 
      input = gets.chomp
      exit if input == "q"
      return input.to_i if valid_input? input
    end
  end

  def valid_input? input
    input.to_i >= 1 ? (return true) : (return false)
  end

end