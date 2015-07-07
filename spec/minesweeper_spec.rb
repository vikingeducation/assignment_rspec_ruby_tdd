
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

describe Cell do

  let(:c){Cell.new}
  
  it "is a cell" do
    expect(subject).to be_a(Cell)
  end

  describe '#initialize' do

    it ' should create a cell' do
      expect(c).to be_a(Cell)
    end

    it 'should create an type attribute for cell - blank at first' do
      expect(c.type).to eq("blank")
    end

    it 'should create non visible cells at first' do
      expect(c.visible).to eq(false)
    end
    
  end

  describe '#is_bomb?' do
    
    it 'should return false if cell type is not bomb' do
      # c.type = "bomb"
      expect(c.type == "bomb").to eq(false)
    end

    it 'should return true if cell type is bomb' do
      c.type = "bomb"
      expect(c.type == "bomb").to eq(true)
    end

  end

  describe '#is_visible?' do

    it 'should return false if cell is not visible' do
      expect(c.is_visible?).to eq(false)
    end
  end

  # describe '#is_number?' do

  #   it 'should return false if c isnt number' do
  #     expect(c.is_number?).to eq(false)
  #   end

  # end

end

describe Board do

  let(:b){Board.new}
  let(:b_custom){Board.new(12)}
  let(:b_small){Board.new(2)}

  it "is a board" do
    expect(subject).to be_a(Board)
  end
  
  
  describe "#initialize" do
        
    it "creates the default gameplay board" do 
      
      expect(b.game_board).to be_a(Array)
    end
   
    
    
    it "makes the custom sized board" do
      expect(b_custom.game_board.length).to eq(12) 
    end

  end

  describe '#rand_bomb_select' do
    

    # it 'should return an object(cell)' do
    #   b_custom.rand_bomb_adder(12,12)
    #   expect(b_custom.game_board[3][3]).to be_a(Cell)
    # end

    # it 'should include B somewhere in array' do
        
      
    #   # b_custom.game_board[1][1].type = "bomb"
    #   b_small.rand_bomb_adder(2,2)
    #   expect(b_small.game_board[1][1].type).to eq("bomb")
    # end

    # it 'should have x amount of Bombs in the array' do
    #   value = 0
    #   b_small.rand_bomb_adder(2, 2)
    #   b_small.game_board.each_with_index do |row, index|
    #     row.each_with_index do |cell, cell_index|
    #       if b_small.game_board[index][cell_index].type == "bomb"
    #         value +=1
    #       end
    #     end
    #   end
    #   expect(value).to eq(3)
    # end
                

  end


  describe '#number_hints' do
    
    it "sets numbers adjacent to bombs" do
      b.game_board[2][2].type = "bomb"
      b.number_hints_horz
      expect(b.game_board[2][1].value).to eq(1)
      expect(b.game_board[2][3].value).to eq(1)
    end

  end


end

  # describe '#'


  