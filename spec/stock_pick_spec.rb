require_relative '../lib/stock_pick'

describe 'stock pick' do
    
    let(:sp){Stock_pick.new}
    
    it"have one input and only allow array input set" do
        expect{sp.assign("I'm not an array")}.to raise_error()
    end
    
    it "sort the input array and make a hash from that" do
        expect(sp.sortIntoHash([1,2,23,23,12,10,10])).to eq({0=>1, 1=>2, 2=>23, 3=>23, 4=>12, 5=>10, 6=>10})
    end
    
    it "can assign value" do
       sp.assign([1,2,3,2,1,45,62])
       expect(sp.dailyValue)
       .to eq([1,2,3,2,1,45,62])
    end
    
    it "sort the daily value hash" do
        sp.hashsort({0=>1, 1=>2, 2=>23, 3=>23, 4=>12, 5=>10, 6=>10})
        expect(sp.hashSort)
        .to eq([[0, 1], [1, 2], [5, 10], [6, 10], [4, 12], [2, 23], [3, 23]])
    end
    
    it "clean days with continuous same value and only keep the earliest date" do
        expect(sp.hashClean([[0, 1], [1, 2], [5, 10], [6, 10], [4, 12], [2, 23], [3, 23]]))
        .to eq([[0, 1], [1, 2], [5, 10], [4, 12], [2, 23]])
    end
    
    it "judge if day of larger value is also later day" do
       expect(sp.compare([10,5], [9,16])).to eq(-1) #if the larger value day is earlier, return a wrong number
       expect(sp.compare([10,5], [12,16])).to eq([10,12]) #if it's later, return the value
    end
    
    it "loop until find the true value" do
       expect(sp.getdate([[0, 1], [1, 2], [5, 10], [6, 10], [4, 12], [2, 23], [3, 23]])).to eq([0,3])
       expect(sp.getdate([[10, 1], [9, 2], [8, 10], [7, 10], [6, 12], [5, 23], [4, 23]])).to eq([0,0])
    end
    
    it "tests in several cases" do
        expect(sp.pick([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2, 6])
        expect(sp.pick([44, 43, 42, 41, 40, 38])).to eq([0, 0])
        expect(sp.pick([3, 3, 3, 3, 5, 5, 5, 5, 5])).to eq([0, 4])
        expect(sp.pick([3, 3, 3, 3, 3, 3, 3, 3, 3])).to eq([0, 0])
    end
    
end
   