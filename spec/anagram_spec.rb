require 'anagram'

describe '#anagram' do
  it "should take a one-word string input" do
    expect{anagram('HIJACK')}.not_to raise_error
  end

  it "should accept lower-case words" do
    expect(anagram('Competence')).to eq(anagram('COMPETENCE'))
  end

  it "should only use the first word given" do
    expect(anagram('COMPETENCE FLYING')).to eq(anagram('COMPETENCE'))
  end

  it "should load the dictionary" do
    allow(File).to receive(:open)
    expect(File).to receive(:open)
    anagram("COMPETENCE")
  end

  context 'return' do
    it "should return an array of anagrams if there are any" do
      allow(File).to receive(:open).and_return([""])
    end

    it "should not return the original word"

    it "should return an exhaustive list"

    it "should return an empty array if there are no anagrams"
  end
end