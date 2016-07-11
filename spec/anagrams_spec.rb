require_relative '../lib/anagrams'
require 'spec_helper'

describe Anagrams do

  let(:a){Anagrams.new}

  describe '#anagrams' do

    it 'raises an error if no arguments are entered' do
      expect{a.anagrams}.to raise_error(ArgumentError)
    end

    it 'raises an error if only one argument is entered' do
      expect{a.anagrams}.to raise_error(ArgumentError)
    end

    it "checks a basic dictionary and basic word" do
      expect(a.anagrams("looter", ["spooky", "retool", "rootle", "tooler", "toddler"])).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end

    it "checks another dictionary and more complex word" do
      expect(a.anagrams("zygote", ["spooky", "retool", "rootle", "tooler", "toddler"])).to eq([])
    end

  end

end