require 'anagrams'

describe '#anagrams' do
	it 'takes a one word string' do
		expect{ anagrams(12) }.to raise_error(ArgumentError)
	end

	it 'checks if split is called' do
		string = "string"
		expect(string).to receive(:split).and_return(["s", "t", "r", "i", "n", "g"])
		anagrams(string)
	end

	it 'properly loads dictionary' do
		expect(File).to receive(:readlines).and_return(["s", "t", "r", "i", "n", "g"])
	  anagrams("st")
	end

end
