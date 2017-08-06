module DiceThrower
  class Score
    attr_reader :players

    def initialize(player1, player2)
      @players = {player1 => 0, player2 => 0}
    end

    def update
      @players[player_with_higher_total_sum] += 1 if player_with_higher_total_sum
    end

    def to_s
      "***** SCORE *****\n" +
      @players.map { |player, score| "#{player.name}:  #{score} wins"}.join("\n") +
       "\n*****************"
    end

    private

    def player_with_higher_total_sum
      sums = @players.map { |player, _| [player, player.dices_rolled.reduce(:+)] }.to_h
      return if sums.values.uniq.one?

      sums.max_by { |_, sum| sum }.first
    end
  end
end
