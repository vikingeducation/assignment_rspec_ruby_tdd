require 'anagrams'

describe '#anagrams' do

	let(:string) {"looter"}

	#makes a double with "File" identifier (i.e. a fake "File" object)
	let(:my_file_double) { double("File") }

	#this before hook "spoofs" file IO inside the method
	before(:each) do
		allow(File).to receive(:open).and_return(my_file_double)
		allow(my_file_double).to receive(:readlines).and_return(["RETOOL", "ROOTLE", "TOOLER", "LOOTER", "haha", "banana", "teststring"])
		allow(my_file_double).to receive(:close)
	end

	it 'takes a string argument' do
		expect{ anagrams(12) }.to raise_error(ArgumentError)
	end

	it 'obtains readlines' do
		expect(my_file_double).to receive(:readlines).and_return( ["c", "b", "a"] )
		anagrams("string")
	end

	it 'split is called' do
		expect(string).to receive(:split).and_return(["s", "t", "r", "i", "n", "g"])
		anagrams(string)
	end

	it 'sort is called' do
		string_split = string.split("")
		allow(string).to receive(:split).and_return(string_split)
		expect(string_split).to receive(:sort).and_return(["a"])
		anagrams(string)
	end

	it 'join is called' do
		chain_output = ["a", "b","c"]
		# receive_message_chain stubs method chains hahaha
		allow(string).to receive_message_chain(:split, :sort).and_return(chain_output)
		expect(chain_output).to receive(:join).and_return("abc")
		anagrams(string)
	end

	it 'upcase is called' do
		chain_output = "abc"
		allow(string).to receive_message_chain(:split, :sort, :join).and_return(chain_output)
		expect(chain_output).to receive(:upcase).and_return("ABC")
		anagrams(string)

	end

	it 'returns an array' do
		expect(anagrams("looter").class).to eq(Array)
	end

	it 'return array is all uppercase' do
		expect(anagrams("looter").all? { |x| x == x.upcase }).to eq(true)
	end

	it 'returns empty array if no anagram exists' do
		expect(anagrams("asdfasdfasdaf")).to eq([])
	end

	it 'finds all correct anagrams' do
		expect(anagrams("looter")).to eq(["RETOOL", "ROOTLE", "TOOLER"])
	end

end
