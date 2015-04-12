require('anagram')

describe Anagram do
	let(:a){Anagram.new}

	it 'only accepts one word inputs' do
		expect{a.anagram("hello world")}.to raise_error
	end

	it 'doesn\'t accept integer inputs' do
		expect{a.anagram(1)}.to raise_error
	end

	it 'doesn\'t accept float inputs' do
		expect{a.anagram(1.5)}.to raise_error
	end

	it 'returns an empty array if no anagrams' do
		expect(a.anagram("zygote")).to eq([])
	end

	it 'returns an array of anagrams if there are any' do
		allow(a).to receive(:has_anagram?).and_return(true)
		allow(a).to receive(:get_anagram).and_return(["tool","loot"])
		expect(a.anagram("tool")).to eq(["tool","loot"])
	end

end