require 'spec_helper'
require 'anagram'

describe "#anagram" do
	let(:word) { "looter" }
	let(:arr) { %w{retool rootle tooler spooky} }

	it 'throws error if first input is not a string' do 
		expect{anagram(1)}.to raise_error(ArgumentError)
	end

	it 'throws error if second input is not an array' do 
		expect{anagram("hello")}.to raise_error(ArgumentError)
	end

	it 'returns anagrams from array dictionary' do 
		expect(anagram(word, arr)).to eq(["retool", "rootle", "tooler"])
	end
	
end