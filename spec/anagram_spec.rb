require 'anagram'

describe "Anagrams" do 
  let(:anagram){ Anagram.new }
  let(:file){ File.new }


  describe "#anag" do

    describe "input" do

      it "checks that a string is passed" do
          expect{anagram.ana(1)}.to raise_error("String not passed")
          expect{anagram.ana([1,2])}.to raise_error("String not passed")
      end
    end

    describe "output" do

      it "outputs an array" do


      end




      it "if no anagram is found, return empty array" do

      end

    end

    # describe "dictionary" do

    #   it "checks that dictionary is not empty" do

    #     file = File.open("enable.txt", "r")
    #     dictionary = file.readlines

    #     expect{dictionary}.to_not eq()        

    #   end

    # end

    describe "functionality" do

      it "returns an empty string for word with no anagrams" do
        allow(file).to receive(:open).and_return("zygote")

        expect(anagram.ana("zygote")).to eq([])

      end

      it "returns the anagrams from a word with anagrams as an array" do

        expect(anagram.ana("pears")).to eq(["APERS","APRES","ASPER","PARES","PARSE","PRASE","PRESA","RAPES","REAPS","SPARE","SPEAR"])

      end
    
    end


  end

end