require 'anagrams'


describe Anagrams do


  let (:a) { Anagrams.new }
  let (:my_file_double) { double("File") }
  let (:options) { ["NIB", "BIN", "RETOOL", "ROOTLE", "TOOLER"] }


  before do 
    allow(File).to receive(:open).and_return(my_file_double)
    allow(my_file_double).to receive(:readlines).and_return(options)
  end


  describe '#anagrams' do

    it "raises error if input is not a string" do
      expect{a.anagrams(123)}.to raise_error(ArgumentError)
    end

    it "raises error if input is more than one word" do
      expect{a.anagrams("George Washington")}.to raise_error(ArgumentError)
    end

    it "returns uppercase words" do
      match = "bin"
      result = a.anagrams("nib")
      expect(result).to eq([match.upcase])
    end

    it "returns a list of valid anagrams for a word" do
      result = a.anagrams("looter")
      expect(result).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end

    it "returns an empty array if the word has no anagrams" do
      expect(a.anagrams("zygote")).to eq([])
    end


  end

end