require_relative "../lib/tdd_warmups.rb"

describe Warmups do

  let (:w) {Warmups.new}
  let (:a) {[44, 30, 24, 32, 35, 30, 40, 38, 15]}

  describe "#stock_picker" do

    it "should return error if no arguments" do

      expect(w.stock_picker).to raise_error(ArgumentError)

    end

    it "raise an error if argument is not an array" do

      string = "Hello"
      expect(w.stock_picker(string)).to raise_error("Only accepts days in an array")

    end

    it "should return an array with two integers" do

      expect(w.stock_picker(a)).to be_a(Array)
      expect(w.stock_picker(a).length).to eq(2)

    end

    it "should return integers within the array length" do

      result = w.stock_picker(a)
      check = result.all? { |number| (0..(a.length)).include?(number) }

      expect(check).to be true

    end

    specify "the second number in the return array is always bigger than the first" do

    result = w.stock_picker(a)
    expect( result[0] < result[1]). to be true

    end


    it "returns the most profitable days" do

      expect(w.stock_picker(a)).to be eq([2.6])

    end


  end

end