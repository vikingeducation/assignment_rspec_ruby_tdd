# should return a list of anagram if possible
# should return an empty list if no anagram

require "anagram"

describe "#anagram" do

  context "Dictionary as Array argument" do
    it "should return a list of anagram if possible" do
      expect(
        anagram("looter", ["spooky", "retool", "rootle", "tooler", "toddler"])
        ).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end

    it "should return an empty list if no anagram" do
      expect(
        anagram("zygote", ["spooky", "retool", "rootle", "tooler", "toddler"])
        ).to eq([])
    end

    it "should return a list of anagram if possible" do
      expect(
        anagram("silent", ["hello", "listen", "tensil", "silenp"])
        ).to eq(["LISTEN", "TENSIL"])
    end

    it "should not include the compare word in the return list" do
      expect(
        anagram("silent", ["silent", "hello", "listen", "tensil", "silenp"])
        ).to eq(["LISTEN", "TENSIL"])
    end
  end

  context "Dictionary as File"

    it "should read the document" do
      allow(File).to receive(:readlines).and_return(["silent", "hello", "listen", "tensil", "silenp"])
      expect(File).to receive(:readlines)
      anagram("silent")
    end

    it "should compare to a dictionary File if only one argument passed" do
      allow(File).to receive(:readlines).and_return(["silent", "hello", "listen", "tensil", "silenp"])
      expect(anagram("silent")).to eq(["LISTEN", "TENSIL"])
    end

end