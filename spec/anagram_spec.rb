require 'anagrams'

describe "Anagrams" do 
  let(:anagram){ Anagrams.new }


  describe "#anag" do

    it "checks that a string is passed" do
        expect{anagram.ana(1)}.to raise_error("String not passed")
        expect{anagram.ana([1,2])}.to raise_error("String not passed")
    end

  end

end