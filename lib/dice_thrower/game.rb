module DiceThrower
  class Game
    def initialize(computer = Computer.new, human = Human.new)
      @computer = computer
      @human = human
      @score = Score.new(@computer, @human)
    end

    def throw
      loop do
        display_instructions
        @human.roll_dice

        return puts 'Have a nice day!' if @human.quit?
        @computer.roll_dice(@human.dices_rolled.size)
        @score.update
      end
    end

    private

    def display_instructions
      puts <<~INSTRUCTION
        Welcome to Dice Thrower
        Instructions:
        Enter how many dice you'd like to throw
        If your total is higher than the computer, you win!
        Enter 'q' to quit.

        #{@score}
      INSTRUCTION
    end
  end
end
