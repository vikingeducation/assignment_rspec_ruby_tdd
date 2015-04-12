require('anagram')

describe "#anagram" do

	it 'only accepts one word inputs' do
		expect{anagram("hello world")}.to raise_error(ArgumentError, "Too many words")
	end

	it 'doesn\'t accept integer inputs' do
		expect{anagram(1)}.to raise_error
	end

	it 'doesn\'t accept float inputs' do
		expect{anagram(5.5)}.to raise_error
	end

	it 'returns an empty array if no anagrams' do
		anagram = double(anagram)
		allow(anagram).to receive(:has_anagrams?).and_return(false)
		expect(anagram("zygote")).to eq([])
	end

	it 'returns an array of anagrams if there are any' do
		anagram_positive = double(:has_anagrams? => true)
		expect(anagram_positive).to receive(:get_anagrams).and_return(["tool"])
		anagram("loot")
	end

end