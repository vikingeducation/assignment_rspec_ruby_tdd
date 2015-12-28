require 'anagrams'

describe Anagram do

  let(:anagram){Anagram.new}
  let(:file_like_object) { double("file like object", :read => "RETOOL ROOTLE TOOLER") }

  it 'is an instance of Anagram' do
    expect(subject).to be_a(Anagram)
  end

  describe '#anagrams' do
    it "raises an error when anything but a string is used as an argument" do
      expect{anagram.anagrams(4)}.to raise_error(ArgumentError)
    end

    it "raises an error if argument contains more than one word" do
      expect{anagram.anagrams("John Howard")}.to raise_error(ArgumentError)
    end

    it "doesn't raise error if argument is one word" do
      allow(File).to receive(:open).with('enable.txt', 'r').and_return(file_like_object)
      expect{anagram.anagrams("underworld")}.to_not raise_error
    end

    it "returns an array of anagrams of the argument" do
      allow(File).to receive(:open).with('enable.txt', 'r').and_return(file_like_object)
      expect(anagram.anagrams("looter")).to eq(['RETOOL', 'ROOTLE', 'TOOLER'])
    end

    it "returns an empty array if no anagrams" do
      allow(File).to receive(:open).with('enable.txt', 'r').and_return(file_like_object)
      expect(anagram.anagrams("ziggler")).to eq([])
    end
  end
end

=begin
  4. anagrams("looter") - ["RETOOL", "ROOTLE", "TOOLER"]
  5. anagrams("zygote") - []
=end