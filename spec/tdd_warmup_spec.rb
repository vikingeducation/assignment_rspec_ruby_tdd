require_relative "../lib/tdd_warmups.rb"

describe Warmups do

  let (:w) {Warmups.new}
  
  describe "#stock_picker" do
  let (:a) {[44, 30, 24, 32, 35, 30, 40, 38, 15]}
  let (:b) {[30, 40]}
  let (:c) {[30, 20, 10]}

    it "should return error if no arguments" do

      expect{w.stock_picker()}.to raise_error(ArgumentError)

    end

    it "raise an error if argument is not an array" do

      string = "Hello"
      expect{w.stock_picker(string)}.to raise_error("Only accepts days in an array")

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

      expect(w.stock_picker(a)).to eq([2,6])
      expect(w.stock_picker(b)).to eq([0,1])

    end

    it "returns 0 if there's no profit to be made" do

      expect{w.stock_picker(c)}.to output("Sorry, no profit in these days :(\n").to_stdout
      expect(w.stock_picker(c)).to eq([0,0])

    end

  end

  describe "#anagrams" do

    let (:word){"looter"}

    it "should raises error if no arguments" do

      expect{w.anagrams()}.to raise_error(ArgumentError)

    end

    it "raises an error if argument is not a string" do

      number = 33
      expect{w.anagrams(number)}.to raise_error("Only accepts one word")

    end

    it "should return an error if sent more than one word" do

      two_words = "Hello World"
      expect{w.anagrams(two_words)}.to raise_error("Only accepts one word")

    end

    it "should return an array" do

      expect(w.anagrams(word)).to be_a(Array)

    end

    specify "the words in the array should all have the same length as the argument" do

      result = w.anagrams(word)

      check_length = result.all? {|w| word.length == w.length}

      expect(check_length).to be true

    end

    specify "the words in the array should exist in english" do

      dictionary = ["rootle", "tooler", "hello", "world", "retool"]
      result = w.anagrams(word)

      check_english = result.all? {|w| dictionary.include?(w)}

      expect(check_english).to be true

    end

    specify "the words in the array should have the exact same letters as the argument" do

      letters_in_word = word.split("").sort

      result = w.anagrams(word)

      check_all_letters_included = result.all? { |w| w.split("").sort == letters_in_word}

      expect(check_all_letters_included).to be true

    end

    specify "the orginal word sent as argument is not included in the return array" do

      result = w.anagrams(word)

      expect(result.include?(word)).to be false

    end

    it "should not return an empty array if there are possible anagrams" do

      expect(w.anagrams(word)).not_to eq([])

    end

    it "should return an empty array if there are no possible anagrams" do

      expect(w.anagrams("zygote")).to eq([])

    end


  end

end