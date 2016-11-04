require 'anagrams'

describe '#anagrams' do
	let(:dictionary) { %w(spooky retool rootle tooler toddler) }

  it 'raises an error if not given parameters' do
  	expect{ anagrams }.to raise_error(ArgumentError)
  end

  it 'raises an error if not given a dictionary' do
  	expect{ anagrams("word") }.to raise_error(ArgumentError)
  end

  it 'raises an error if not given a string word' do
  	expect{ anagrams(1, dictionary) }.to raise_error(ArgumentError)
  end

  it 'raises an error if not given a dictionary list of words' do
  	expect{ anagrams("word", "fake dictionary") }.to raise_error(ArgumentError)
  end

  it 'does not return the original word you sent it' do
    expect(anagrams("something", dictionary)).not_to include("something")
  end

  it 'only will only find anagrams for a single word' do
    expect{ anagrams("two words", dictionary) }.to raise_error("Please enter one word only")
  end

  it 'returns a list of matching anagrams' do
    expect(anagrams("looter", dictionary)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it 'returns an empty list if no anagrams are found' do
    expect(anagrams("zygote", dictionary)).to eq([])
  end
end

