require 'anagrams'

describe '#anagrams' do
  let(:included_word) { 'retool' }
  let(:dictionary) { %w(spooky looter rootle tooler toddler) }
  let(:expected_matches) { %w(looter rootle tooler) }
  let(:word_with_no_matches) { 'coyote' }

  context 'raises an error if' do
    it "the first argument is not a string" do
       expect { anagrams(:not_a_string, dictionary) }.to raise_error(ArgumentError)
    end

    it "the first argument is more than one word" do
       expect { anagrams('two words', dictionary) }.to raise_error(ArgumentError)
    end

    it "the second argument is not an array" do
       expect { anagrams(included_word, 'not an array') }.to raise_error(ArgumentError)
    end
  end

  it "handles trailing whitespaces on the input word" do
    expect(anagrams(included_word + "  ", dictionary)).to eq(expected_matches)
  end

  it "notifies the user if the word does not have any matches" do
    expect { anagrams(word_with_no_matches, dictionary) }.to output("Sorry, there are no anagrams for 'coyote'.\n").to_stdout
  end

  it "returns a list of anagrams from the dictionary" do
    expect(anagrams(included_word, dictionary)).to eq(expected_matches)
  end

  it "handles mixed-case words" do
    expect(anagrams(included_word.upcase, dictionary)).to eq(expected_matches)
  end

end


