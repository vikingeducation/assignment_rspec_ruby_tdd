require 'anagram'

describe "Anagrams" do 
  let(:anagram){ Anagram.new }
  # let(:file){ File.new }


  describe "#anag" do



    describe "input" do

      it "checks that a string is passed" do
        
          file = double("File", :readlines => "zygote")

          expect{anagram.ana(1, file)}.to raise_error("String not passed")
          expect{anagram.ana([1,2], file)}.to raise_error("String not passed")
      end
    end

    describe "output" do

      it "outputs an array" do

        allow(file).to receive(:readlines).and_return("PEARS")

        expect(anagram.ana("PEARS", file)).to eq(["APERS","APRES","ASPER","PARES","PARSE","PRASE","PRESA","RAPES","REAPS","SPARE","SPEAR"])

      end


      it "if no anagram is found, return empty array" do

        allow(file).to receive(:readlines).and_return("zygote")

        expect(anagram.ana("zygote", file)).to eq([])

      end

    end


    describe "functionality" do

      it "returns an empty string for word with no anagrams" do
        allow(file).to receive(:readlines).and_return("zygote")

        expect(anagram.ana("zygote", file)).to eq([])

      end

      it "returns the anagrams from a word with anagrams as an array" do
        allow(file).to receive(:readlines).and_return("PEARS")

        expect(anagram.ana("PEARS", file)).to eq(["APERS","APRES","ASPER","PARES","PARSE","PRASE","PRESA","RAPES","REAPS","SPARE","SPEAR"])

      end
    
    end


  end

end