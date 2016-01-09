require 'anagrams'

dictionary = ["RETOOL", "ROOTLE", "TOOLER", "LOOTER", "PEARS", "PARES", "MOM"]

describe "#anagrams" do
  it "throws ArgumentError if input is empty string" do
    expect{anagrams("")}.to raise_error(ArgumentError)
  end

  it "throws ArgumentError if input is not a string" do
    expect{anagrams(0)}.to raise_error(ArgumentError)
  end

  it "returns anagram list for pears" do
    allow(File).to receive(:readlines).and_return(dictionary)
    expect(anagrams("pears")).to eq(["PARES"])
  end

  it "returns anagram list for retool" do
    allow(File).to receive(:readlines).and_return(dictionary)
    expect(anagrams("retool")).to eq(["ROOTLE", "TOOLER", "LOOTER"])
  end

  it "doesn't return self as anagram if it is a palindrome" do
    allow(File).to receive(:readlines).and_return(dictionary)
    expect(anagrams("mom")).to eq([])
  end

  it "returns empty if there are no anagrams in dictionary" do
    allow(File).to receive(:readlines).and_return(dictionary)
    expect(anagrams("zygote")).to eq([])
  end

end