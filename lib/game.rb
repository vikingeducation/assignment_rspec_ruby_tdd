require_relative "./listener"
require_relative "./player"
require_relative "./render"

class Game
  attr_reader :dice, :player1, :player2

  def initialize(listener: false, renderer: false)
    @render = renderer || Render
    @listener = listener || Listener
    @player1 = Player.new
    @player2 = Player.new
  end

  def play
    loop do
      render.score(player1.wins, player2.wins)
      set_dice
      break unless dice.is_a?(Fixnum)
      Render.long_wait if dice > 50_000_000
      run_matchup
      declare_winner
    end
  end

  private
    attr_reader :listener
    attr_reader :render
    attr_writer :dice

    def declare_winner
      render.round_scores(player1.score, player2.score)
      case
      when player1.score > player2.score
        player1.won
        render.win
      when player1.score < player2.score
        player2.won
        render.loss
      else
        render.tie
      end
    end

    def roll_dice
      player1.score += rand(6)
      player2.score += rand(6)
    end

    def run_matchup
      player1.score, player2.score = 0, 0
      dice.times {roll_dice}
    end

    def set_dice
      @dice = listener.get_input
    end
end