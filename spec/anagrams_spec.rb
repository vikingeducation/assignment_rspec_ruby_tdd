require 'anagrams'

describe '#anagrams' do

	let(:my_file_double) { double("File") }

	before(:each) do
		allow(File).to receive(:open).and_return(my_file_double)
		allow(my_file_double).to receive(:readlines).and_return( ["a", "b", "c"]  )
		allow(my_file_double).to receive(:close)
	end

	it 'takes a one word string' do
		expect{ anagrams(12) }.to raise_error(ArgumentError)
	end

	it 'properly obtains readlines' do
		expect(my_file_double).to receive(:readlines).and_return( ["c", "b", "a"] )
		anagrams("string")
	end

	it 'checks if split is called' do
		string = "string"
		expect(string).to receive(:split).and_return(["s", "t", "r", "i", "n", "g"])
		anagrams(string)
	end


end
