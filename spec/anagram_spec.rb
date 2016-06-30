require_relative "../anagram.rb"
describe "anagrams" do
  it "returns 3 valid words - anagram for looter" do
    allow(File).to receive(:readlines).and_return(["spooky", "retool", "rootle", "tooler", "toddler"])
    expect(anagrams("looter")).to eq(["retool", "rootle", "tooler"])
  end

  it "returns empty array - anagram for zygote" do
    allow(File).to receive(:readlines).and_return(["spooky", "retool", "rootle", "tooler", "toddler"])
    expect(anagrams("zygote")).to eq([])
  end
end
