class Anagrams

  attr_reader :word

  def initialize( word )
    raise ArgumentError, "Bad input!" unless word.is_a?(String)
    @word = word
  end

  def find_anagrams
    anagram_matches = []
    @word.chars.permutation do |word_permutation|
      word_permutation = word_permutation.join.upcase
      File.open("path/to/dictionary.txt").each do |word_in_dict|
        if word_in_dict.strip.upcase == word
          next
        elsif word_in_dict.strip.upcase == word_permutation
          anagram_matches << word_permutation
        end
      end
    end
    anagram_matches.uniq
  end
end