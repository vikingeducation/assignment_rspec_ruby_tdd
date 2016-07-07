require 'spec_helper'
require 'anagram'
require 'pry'


#2. Anagram Testing

#Write a method anagrams which takes in a string and an array of words (the "dictionary") returns an array of anagrams that can be made with the specified string. Assume the input is only a single word (e.g. "loot" not "William Shakespeare").

#Example:

#> anagrams("looter", ["spooky, retool, rootle, tooler, toddler"])
# => ["RETOOL", "ROOTLE", "TOOLER"]
#> anagrams("zygote", ["spooky, retool, rootle, tooler, toddler"])
#=> []
#(Optional) Loaded Dictionary

#Now that you have figured out the simple case, try TDD-ing an anagrams method which only takes a single input, the word, and instead loads the dictionary from a file. To build a good unit test for anagrams, you'll need to figure out how to mock the process of loading in the dictionary.

#For example: in your setup, you could allow the File class to receive :readlines and return an array of your own creation as dictionary.

#Again, you'll need to think things through ahead of time. If your examples are more than a few lines long, you're overcomplicating things.

describe '#anagram' do

	let( :string ) { "looter" }
	let( :array ) { ["spooky, retool, rootle, tooler, toddler"] }
	let( :array2 ) { ["joe, chair, forest, water"] }


	it 'should raise argument error if wrong # args passed' do

		expect{ find( string ) }.to raise_error( ArgumentError )

	end

	it 'should raise type error if wrong args passed in' do

		expect{ find( [3,4], 8 ) }.to raise_error( "Enter valid args" )

	end

	it 'should return the matching anagram' do

		expect( find( string, array ) ).to eq( ["RETOOL", "ROOTLE", "TOOLER"])

	end

	it 'should raise no anagrams if the none found' do

		expect{ find( string, array2 ) }.to raise_error("No anagrams!")

	end


end