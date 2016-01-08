require 'player'

class Human < Player
  def ask_for_number
    input = gets.chomp

    return false if input == "quit"
    return ask_for_number unless (1..6) === input.to_i

    input.to_i
  end
end
