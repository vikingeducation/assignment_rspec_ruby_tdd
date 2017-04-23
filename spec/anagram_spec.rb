require 'anagram'

describe '#anagram(string, dictionary)' do

  let(:string) { "looter" }
	let(:dict) { %w(spooky retool rootle tooler toddler) }

  it 'raises an error if the first argument is not a string' do
    expect{ anagram(1, dict) }.to raise_error(ArgumentError)
  end

  it 'raises an error if the second argument is not an array' do
  	expect{ anagram(string, 2) }.to raise_error(ArgumentError)
  end

  it 'raises no error when the first argument is a string and the second argument is an array' do
    expect{ anagram(string, dict) }.not_to raise_error
  end

  it 'returns an array with words from dict (in uppercase) that match the letters of string' do
    expect(anagram(string, dict)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end 

  it 'returns an empty array when there are no matches' do 
    expect(anagram("zygote", %w(spooky retool rootle tooler toddler))).to eq([])
  end

end