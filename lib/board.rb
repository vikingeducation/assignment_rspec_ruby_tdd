class Board
attr_reader :sum, :rolls

  def initialize(players)
    @sum = []
    @rolls = []
    @players = players
  end


# [[],[]]
  def add
    @players.each {|player| @rolls << player.roll}
    sum_up
  end


  private

    def sum_up
      player1_score = 0
      player2_score = 0
      @rolls.each do |round|
        player1_score += round[0]
        player2_score += round[1]
      end
      [player1_score, player2_score]
    end

end
