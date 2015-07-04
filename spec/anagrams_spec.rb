require 'anagrams'

=begin
happy
  > anagrams("looter")
# => ["RETOOL", "ROOTLE", "TOOLER"]

sad
> anagrams("zygote")
#=> []

bad
  string with numbers as input, multiple words


=end

describe "takes a string and returns anagram" do
  let(:library){["RETOOL", "ROOTLE", "TOOLER", "FOOD", "HUNGRY"]}
  it "returns array of anagrams for a word" do

    expect(anagrams("looter",library)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it "returns empty array if no anagrams" do
    expect(anagrams("zygote",library)).to eq([])
  end

  it "returns an error if word contains numbers" do
    expect{anagrams("we234",library)}.to raise_error(ArgumentError)
  end

  it "returns an error if input more than one word" do
    expect{anagrams("william shakespeare",library)}.to raise_error(ArgumentError)
  end


end