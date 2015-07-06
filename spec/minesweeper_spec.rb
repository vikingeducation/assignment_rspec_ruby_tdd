
require 'minesweeper.rb'

=begin
  -Main class Minesweeper 
  

  -Board class 
    -initalize 
        -creates board and random bombs 
        - randombomb will push in bombs row.random(i),column.random(i)   
              row = (0...i), column = 0...i
              game_board[rand(i)][rand(i)] = "bomb" ((U+1F4A3))
    -Render method
       renders the board
    -update 
       -change blanks into numbers/bombs that are nearby recent    click [coordinates] - call bomb and numbers and blanks
    -flags
        marks coords with a flag
    -blanks
        opens up if it is touching the coords that are empty. 
    -bombs
        marks true of false for bomb present
    -numbers
        look around the coords and puts the number of bombs nearby
  -Player
    -take turn
        -this allows player to enter coords in x,y,f format.
        -calls validation - loops if off board or already taken.
    -validation
      validates move for placement.

=end

describe Board do
  
  it "is a board" do
    expect(subject).to be_a(Board)
  end
  let(:b){Board.new}
  describe "#initialize" do
        
       it "creates the default gameplay board" do 
          
        expect(b.game_board).to be_a(Array)
       end
    let(:b_custom){Board.new(12)}
    it "makes the custom sized board" do
      expect(b_custom.game_board.length).to eq(12) 
    end
  end



end