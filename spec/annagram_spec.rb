require 'annagram'

describe '#annagram' do
  it "should take a one-word string input" do
    expect{annagram('HIJACK')}.not_to raise_error
  end

  it "should accept lower-case words" do
    expect(annagram('Competence')).to eq(annagram('COMPETENCE'))
  end

  it "should only use the first word given" do
    expect(annagram('COMPETENCE FLYING')).to eq(annagram('COMPETENCE'))
  end

  it "should load the dictionary" do
    allow(File).to receive(:open)
    expect(File).to receive(:open)
    annagram("COMPETENCE")
  end

  context 'return' do
    it "should return an array of annagrams if there are any"

    it "should not return the original word"

    it "should return an exhaustive list"

    it "should return an empty array if there are no annagrams"
  end
end