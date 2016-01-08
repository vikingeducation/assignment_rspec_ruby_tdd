class Human < Player
  def ask_for_number
    puts
    puts "How many dice would you like to roll? (1..6)"
    input = gets.chomp

    if input == "quit"
      @game.quit!
      return 0
    end

    number = input.to_i

    return ask_for_number unless (1..6) === number

    @game.last_player_number = number
  end
end
