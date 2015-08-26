require 'spec_helper'

require_relative '../lib/anagrams.rb'

describe '#anagrams' do
	let(:dictionary) do
		[
			'retool',
			'rootle',
			'tooler',
			'spooler',
			'cooler',
			'fooler'
		]
	end

	before do
		allow(File).to receive(:readlines).with('dictionary.txt').and_return(dictionary)
	end


	it 'accepts a string as a parameter' do
		expect {anagrams('asdf')}.to_not raise_error
	end

	it 'raises an error when the parameter is not a string' do
		expect {anagrams(false)}.to raise_error('Not a string')
	end

	it 'returns an array of anagrams of the given string' do
		expect(anagrams('looter')).to eq(["RETOOL", "ROOTLE", "TOOLER"])
	end

	it 'returns an empty array if no anagrams exist' do
		expect(anagrams('zygote')).to eq([])
	end
end