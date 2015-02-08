require_relative 'board'
require_relative 'cli'
require_relative 'legal_moves'

class TowersOfHanoi
  attr_reader :height, :board, :legal_moves, :cli
  def initialize(height)
    @height = height
    @board = Board.new(height)
    @legal_moves = LegalMoves.new(@board)
    @cli = CLI.new
    print "  Welcome to\n  TOWERS of HANOI\n\nTo quit, press Q at any prompt.\n"
    until board.winning?
      board.render
      turn = cli.take_turn
      if legal_moves.is_legal?(turn)
        board.move(turn)
      end
    end
    board.render
    puts "CONGRATULATIONS!"
  end
end