require_relative '../lib/anagrams'

describe "#anagrams" do

  let(:arg_1) { "looter" }
  let(:arg_2) { %w(spooky retool rootle tooler toddler) }
  let(:words) { anagrams(arg_1, arg_2) }


  it "should take a single word string as an argument" do
    expect(arg_1).to be_a_kind_of(String)
  end

  it "should also take an array of words as an argument" do
    expect(arg_2).to be_a_kind_of(Array)
  end

  context "given a string and an array of words" do

  it "should return an array" do
    expect(words).to be_a_kind_of(Array)
  end

  it "should return an array of words in string" do
    expect(words[0]).to be_a_kind_of(String)
  end

  it "should return only anagrams of string provided" do
    expect(words[0].chars.sort).to eq(arg_1.chars.sort)
    expect(words[1].chars.sort).to eq(arg_1.chars.sort)
    expect(words[2].chars.sort).to eq(arg_1.chars.sort)
  end


end

end
