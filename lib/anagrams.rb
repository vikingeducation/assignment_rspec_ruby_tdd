class Anagrams

  attr_accessor :word

  def initialize( word )
    @word = word
  end

  def find_anagrams
    anagram_matches = []
    # for each permutation of the individual characters in the word string,
    @word.chars.permutation do |word_permutation|
      # set the permutation equal to the joined permutation so the characters aren't separated
      # and downcased so capitalization isn't an issue
      word_permutation = word_permutation.join.downcase
      File.open("/path/to/dictionary.txt") do |file| # open the dictionary file
        file.any? do |word_in_dict| # .any? makes us read lines from the file until the end (nil char)
          # if the stripped word on our current line (stripped b/c newline char)
          # is equal to the input word, go to next block, we don't want it
          if word_in_dict.strip == word
            next
          # elsif the stripped word on our current line
          # is equal to the current permutation of our given word
          elsif word_in_dict.strip == word_permutation
            anagram_matches << word_permutation # shovel the current permutation into matches
          end
        end
      end
    end
    puts "#{anagram_matches}"
  end

end

anagrams( "pears" ) # test case for lowercase word
puts ""
anagrams( "PEARS" ) # test case for uppercase word
puts ""
anagrams( "zygote" ) # test case for word w/ no anagrams