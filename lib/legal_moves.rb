class LegalMoves
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def is_legal?(turn)
    from = turn[:from]
    to = turn[:to]

    from_pole_is_not_empty?(from) &&
    ( to_pole_is_empty?(to) || top_value(from) < top_value(to) )
  end

  def from_pole_is_not_empty?(from)
    !board.poles[from].empty?
  end

  def to_pole_is_empty?(to)
    board.poles[to].empty?
  end

  def top_value(pole)
    board.poles[pole].last
  end
end